# git-handout
*Autor/innen: Iman Hage Hassan (7029051), Andrea Maurer, Enes Hanefi*

# Was ist Git und warum sollte es verwendet werden?

Git ist ein Versionsverwaltungssystem, das Änderungen am Quellcode speichert. Dadurch können Entwickler/innen gemeinsam an einem Projekt arbeiten oder nachvollziehen, wer wan welche Änderungen vorgenommen hat und zu früheren Versionen zurückkehren. Dazu ermöglicht Git das Ausprobieren neuer Ideen mithilfe von Branches, ohne den Hauptcode direkt zu verändern.  Jede gespeicherte Änderung besitzt auch einen eindeutigen Hashwert, anhand dessen sie identifiziert werden kann, was die Sicherheit erhöht. Es unterstüzt auch lokales Arbeiten ohne Internetverbindung.

# Grundlegende Git-Befehle 
(z. B. git init, git add, git commit, git push)

* `git init` - erstellt ein neues lokales Git-Repository
* `git branch` - zeigt eigene Branches
* `git branch <NameDesBranches>`- erstellt einen neuen Branch
* `git clone` - klont ein vorhandenes remote Git-Repository lokal auf eigenen Rechner (wird 1x ausgeführt, anschließend git pull, um Änderungen zu bekommen).
* `git pull` - holt Änderungen vom entfernten Repository und intergriert sie in den aktuellen Branch 
* `git add <eineDatei>` - erstellt eine neue Datei im Repo; bereitet die Datei für den Commit vor
* `git commit -m "Kommentar"` - speichert die vorgemerkten Änderungen lokal
* `git push` - lädt die Commits zu GitHub hoch. 
* `git log` - zeigt die bisherigen Commits
* `git rm <Datei>` - entfernt eine Datei und merkt die Entfernung
* `git mv <Ursprung> <Ziel>` - benennt eine Datei um oder verschiebt sie
* `git status` - zeigt, welche Dateien neu oder geändert sind
* `git --help` - zeigt die allgemeine Hilfe zu Git an
* `git --help <Befehl>` - zeigt die Hilfe zu einem konkreten Befehl an

# Branches
Branches sind eigene Entwicklungszweige innerhalb eines Repositorys. Das ermöglicht Entwickelnden gleichzeitig am Code zu arbeiten, ohne den Code der anderen Entwickelnden zu verändern. Ist die Entwicklung abgeschlossen, wird der Branch zu Github gepusht. Andere Teammitglieder reviewen den Code und geben ihn ggf. frei, sodass ein Merge mit dem Code der anderen Entiwckelnden stattfinden kann. Dabei kann es zu Merge-Konflikten kommen. Diese treten immer dann auf, wenn verschiedene Entwickelnde denselben Inhalt im Repo geändert haben, z. B. selbe Codezeile. In dem Fall löst man den Konflikt auf, indem man Github mitteilt, welche Variante übernommen werden soll. Damit möglichst gar nicht so viele Konflikte entstehen (und um zu sehen wie der Code mittlerweile von anderen verändert wurde), sollte das aktuelle Repo aus dem Haupt-Branch regelmäßig in den eigenen Branch gepullt werden.

# Repositorys in IDEs
Bei modernen Entwicklungsumgebungen wie IntelliJ, PyCharm oder Visual Studio Code lassen sich Repositorys direkt in die IDE miteinbinden. Über die GUI oder Eingabe der Git-Kommandos auf einer integrierten Kommandozeile werden Repository-Aktionen direkt aus der IDE ausgeführt. Ein Pull, und der aktuelle Repo-Stand findet sich in der Entwicklungsumgebung auf dem eigenen Rechner. Dort besteht eine Kopie des Repos. So ist auch Entwicklung möglich, wenn man keine Internetverbindung hat.

Zudem kann man erst mal "für sich selbst" entwickeln, bevor den noch nicht fertigen Code schon alle anderen Projektbeteiligten online im Repo sehen. Mit einem Commit werden die Änderungen am Code in dieses lokale Repo geschrieben. Ist der Code bereit zum Review, wird er aus der Entwicklungsumgebung mit einem Push in das eigentliche Remote-Repository online hochgeladen, wo den Code alle relevanten Projektbeteiligten begutachten können und ggf. der Merge erfolgen kann.