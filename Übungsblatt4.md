## Aufgabe 1.

Empfiehlt Methoden aus Entitäten zu entfernen
z. B. statt User.register() UserRegistered Event
→ sinnvoll, da man so eigentlich Entitäten modellieren sollte

Status als Boolean zu schwach
bei einer Aufgabe gibt es true oder false für erledigt, was zu wenig Differenzierung erlaubt, stattdessen Enum mit erledigt, in arbeit, etc.
→ teilweise sinnvoll, die frage, ob man Zwischenstatus dort benötigt

Wiederholung stärker modellieren
aktuell String und Int, schlägt Weekday, interval, endDate vor
→ sinnvoll

Aggregate Root statt Beziehung bei Freundschaft
mit Pending, Accepted, Blocked, Removed als Status
→ sinnvoll

ToDoInvitation und FriendshipRequest vereinheitlichen
schlägt vor aus beiden als abstraktes Konzept ein Request zu machen, da beide ähnlich sind mit Sender, Empfänger und Status
→ grundsätzlich sinnvoll, allerdings fraglich, ob es so bleibt und dann mehr Sinn ergibt, beides getrennt zu lassen

Rollen bei Team-ToDos modellieren
schlägt vor, einzelne Rollen zu vergeben wer in Team-ToDos etwas an der Aufgabe ändern darf
→ an sich sinnvoll, für unsere App wollen wir es aber möglichst einfach halten, dass es bewusst so gehalten ist: Ist das ToDo mit Freunden geteilt, darf jeder es wie der Ersteller bearbeiten

ToDo als Aggregate Root definieren
Auf ToDos sollte von anderen Aggregaten nur über ToDoId und nicht das komplette Objekt referenziert werden
→ sehr sinnvoll, so würde man es auch bei Datenbanken machen

Fehlende Domain-Events, schlägt vor:
Nutzer
Plain Text
UserRegistered
UserVerified
UserLoggedIn
Freundschaften
Plain Text
FriendshipRequested
FriendshipAccepted
FriendshipRemoved
ToDos
Plain Text
TodoCreated
TodoUpdated
TodoCompleted
TodoDeleted
Team-ToDos
Plain Text
TodoInvitationSent
TodoInvitationAccepted
ParticipantAdded
ParticipantRemoved
→ sinnvoll, hatten wir aber bisher auch noch nicht so genau modelliert

## Aufgabe 2.

### Happy Path:
Gegeben: Benutzer gibt alle Pflichtfelder korrekt an
Wenn: ToDo gespeichert wird
Dann:
    • ToDo wird erstellt 
    • ID wird automatisch vergeben 
    • Daten werden korrekt gespeichert 
Testdaten:
    • Name: "Einkaufen" 
    • Beschreibung: "Milch und Brot kaufen" bzw. ohne, weil Beschreibung immer optional
    • Fälligkeitsdatum: 15.12.2026 
    • Wiederholung: Wöchentlich

### Edges Cases:
Name: minimale und maximale Länge, Umlaute und Sonderzeichen erlaubt → sinnvoll

Beschreibung: leer erlaubt sowie maximale Länge beschränken (5.000 Zeichen) → sinnvoll wie lang es maximal sein darf, müsste man sich noch überlegen

Datum: Schaltjahr, Datum Jahreswechsel etc. → zu kompliziert, würden wir damit umgehen, dass wir auf GUI für Datumseingaben keinen Freitext erlauben, sondern Kalenderansicht zum Auswählen des Datums

Wiederholung: keine Wiederholung zulässig, max. mögliches Wiederholungsintervall → sinnvoll, aber auch hier würde ich Werte vorgeben, z. B. über Checkboxen statt User komplett dem Freitext zu überlassen

### Negative Tests:
Name leer oder besteht nur aus Leerzeichen ist nicht erlaubt → sinnvoll
Datum ungültiges Format (z. B. abc), falsches Datum (z. B. 31.02.) → überflüssig, da Datumsfeld statt freier Eingabe, Datum darf nicht in der Vergangenheit liegen → sinnvoll (könnte aber auch vor Anlegeversuch schon verhindert werden im Kalender)
Wiederholung ungültiger Wert, z. B. „alle_17_tage“ → überflüssig, da kein Freitextfeld
Automatische ID-Vergabe vom System → sinnvoll

LLM-Vorschläge zu „Exception-lastig“: stattdessen sollte Motto immer sein „Wo möglich und sinnvoll, Fehler gar nicht erst entstehen lassen, statt für alles Fehlerbehandlungsstrategie.“

### Reg Ex 
ergeben sich aus zuvor definierten, z. B. mindestens ein Zeichen für Name, wobei Leerzeichen nicht erlaubt