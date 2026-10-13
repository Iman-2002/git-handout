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
* git log - zeigt die bisherigen Commits
* git rm … - entfernt eine Datei und merkt die Entfernung
* git mv … … - benennt eine Datei um oder verschiebt sie
git status - zeigt, welche Dateien neu oder geändert sind
* git --help - zeigt die allgemeine Hilfe zu Git an
* man git - zeigt das Handbuch von Git an (etwas ausführlicher als Hilfe)
