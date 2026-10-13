# git-handout

Autor/innen: Iman Hage Hassan (7029051), Andrea Maurer, Enes Hanefi

Was ist Git und warum sollte es verwendet werden?

Git ist ein Versionsverwaltungssystem, das Änderungen am Quellcode speichert. Dadurch können Entwickler/innen gemeinsam an einem Projekt arbeiten oder nachvollziehen, wer wan welche Änderungen vorgenommen hat und zu früheren Versionen zurückkehren. Dazu ermöglicht Git das Ausprobieren neuer Ideen mithilfe von Branches, ohne den Hauptcode direkt zu verändern.  Jede gespeicherte Änderung besitzt auch einen eindeutigen Hashwert, anhand dessen sie identifiziert werden kann, was die Sicherheit erhöht. Es unterstüzt auch lokales Arbeiten ohne Internetverbindung.

Grundlegende Git-Befehle (z. B. git init, git add, git commit, git push)



* git init - erstellt ein neues lokales Git-Repository
* git add .. - bereitet die Datei für den Commit vor
* git commit -m “...” - speichert die vorgemerkten Änderungen lokal
* git push - lädt die Commits zu Hub hoch. 
* git pull - holt Änderungen vom entfernten Repository und intergriert sie in den aktuellen Branch 
* git branch - zeigt deine Branches
* git branch NameDesBranches - erstellt einen neuen Branch
* git log - zeigt die bisherigen Commits
* git rm … - entfernt eine Datei und merkt die Entfernung
* git mv … … - benennt eine Datei um oder verschiebt sie
git status - zeigt, welche Dateien neu oder geändert sind
* git --help - zeigt die allgemeine Hilfe zu Git an
* man git - zeigt das Handbuch von Git an (etwas ausführlicher als Hilfe)

<h3>Branches</h3>
Branches sind eigene Entwicklungszweige innerhalb eines Repositorys. Das ermöglicht Entwickelnden gleichzeitig am Code zu arbeiten, ohne den Code der anderen Entwickelnden zu verändern. Ist die Entwicklung abgeschlossen, wird der Branch zu Github gepusht. Andere Teammitglieder reviewen den Code und geben ihn ggf. frei, sodass ein Merge mit dem Code der anderen Entiwckelnden stattfinden kann. Dabei kann es zu Merge-Konflikten kommen. Dieser treten immer dann auf, wenn verschiedene Entwickelnde denselben Inhalt im Repo geändert haben, z. B. selbe Codezeile. In dem Fall löst man den Konflikt auf, indem man Github mitteilt, welche Variante übernommen werden soll.