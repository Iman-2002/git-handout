# Domänenmodell

## Herleitung aus dem Event Storming

Aus den identifizierten Events

- Aufgabe erstellt
- Aufgabe bearbeitet
- Aufgabe gelöscht
- Aufgabe erledigt
- Freund hinzugefügt
- Freund entfernt
- Profil bearbeitet

lassen sich die wichtigsten Konzepte der Domäne ableiten.

---

# Entitäten

Entitäten besitzen eine eindeutige Identität und existieren über einen längeren Zeitraum.

## Benutzer

Repräsentiert einen registrierten Nutzer der Anwendung.

Attribute:

- userId
- name
- email
- profilbild

---

## Aufgabe

Repräsentiert eine vom Benutzer verwaltete Aufgabe.

Attribute:

- taskId
- titel
- beschreibung
- status
- kategorie
- faelligkeitsdatum

---

## Freundschaft

Repräsentiert die Beziehung zwischen zwei Benutzern.

Attribute:

- friendshipId
- anfragenderBenutzer
- angefragterBenutzer
- status

---

# Werteobjekte (Value Objects)

Werteobjekte besitzen keine eigene Identität.

## Aufgabenstatus

Mögliche Werte:

- Backlog
- In Bearbeitung
- Erledigt

---

## Kategorie

Mögliche Werte:

- Schule
- Arbeit
- Privat
- Freizeit

---

## Freundschaftsstatus

Mögliche Werte:

- Angefragt
- Akzeptiert
- Abgelehnt

---

# Aggregate

Aggregate bilden fachliche Konsistenzgrenzen.

## Task Aggregate

Aggregate Root:

- Aufgabe

Enthält:

- Aufgabenstatus
- Kategorie

---

## User Aggregate

Aggregate Root:

- Benutzer

Enthält:

- Profilinformationen

---

## Friendship Aggregate

Aggregate Root:

- Freundschaft

Enthält:

- Freundschaftsstatus

---

# Beziehungen

- Ein Benutzer besitzt mehrere Aufgaben.
- Ein Benutzer kann mehrere Freundschaften besitzen.
- Eine Aufgabe kann einem Freund zugewiesen werden.

```mermaid
classDiagram

class User {
    +UUID id
    +String name
    +String email
    +updateProfile()
}

class Profile {
    +String profilePicture
}

class Task {
    +UUID id
    +String title
    +String description
    +TaskStatus status
    +Category category
    +create()
    +update()
    +complete()
    +delete()
}

class Friendship {
    +UUID id
    +FriendshipStatus status
    +accept()
    +reject()
}

class TaskStatus {
    <<enumeration>>
    BACKLOG
    IN_PROGRESS
    DONE
}

class Category {
    <<enumeration>>
    PRIVATE
    WORK
    STUDY
    OTHER
}

class FriendshipStatus {
    <<enumeration>>
    PENDING
    ACCEPTED
    REJECTED
}

User "1" --> "1" Profile
User "1" --> "*" Task :*owns
User "1" --> "*" Friendship

Task --> TaskStatus
Task --> Category

Friendship --> FriendshipStatus
```
## Bounded Context
```mermaid
flowchart LR

    subgraph UMC["User Management Context"]
        Profil["Profil"]
        Benutzer["Benutzer"]

        Profil --> Benutzer
    end

    subgraph TMC["Task Management Context"]
        Status["Status"]
        Kategorie["Kategorie"]
        Aufgabe["Aufgabe"]

        Status --> Aufgabe
        Kategorie --> Aufgabe
    end

    subgraph SMC["Social Management Context"]
        Freundschaft["Freundschaft"]
        Freundschaftsanfrage["Freundschaftsanfrage"]
    end

    Benutzer --> Aufgabe
    Benutzer --> Freundschaft
    Freundschaft --> Aufgabe

    classDef entity fill:#d8d8e8,stroke:#8b6cff,stroke-width:1px,color:#333;
    class Profil,Benutzer,Status,Kategorie,Aufgabe,Freundschaft,Freundschaftsanfrage entity;
```
## Repositorys
```mermaid
classDiagram

%% Entitäten
class User {
    +id: UUID
    +name: String
    +email: String
}

class Task {
    +id: UUID
    +title: String
    +description: String
    +status: TaskStatus
}

class Friendship {
    +id: UUID
    +status: FriendshipStatus
}

%% Domain Services
class TaskService {
    +createTask()
    +updateTask()
    +deleteTask()
    +changeStatus()
    +assignTaskToFriend()
}

class FriendshipService {
    +sendRequest()
    +acceptRequest()
    +rejectRequest()
    +removeFriend()
}

class UserService {
    +updateProfile()
    +deleteProfile()
}

%% Repositories
class TaskRepository {
    +save(task)
    +findById(id)
    +findAll()
    +delete(id)
}

class UserRepository {
    +save(user)
    +findById(id)
    +delete(id)
}

class FriendshipRepository {
    +save(friendship)
    +findById(id)
    +delete(id)
}

%% Beziehungen
TaskService --> TaskRepository
TaskService --> Task

FriendshipService --> FriendshipRepository
FriendshipService --> Friendship

UserService --> UserRepository
UserService --> User

User "1" --> "*" Task
User "1"*--> "*" Friendship
```
## Implementierung
Backend
Json
Frontend
```mermaid
flowchart TD

    A[Frontend] -->|HTTP/REST| B[Backend]

    B --> C[TaskService]
    B --> D[UserService]
    B --> E[FriendshipService]

    C --> F[TaskRepository]
    D --> G[UserRepository]
    E --> H[FriendshipRepository]

    F --> I[(tasks.json)]
    G --> J[(users.json)]
    H --> K[(friendships.json)]
```