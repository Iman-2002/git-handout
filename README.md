[![.github/workflows/test_build_app.yml](https://github.com/Iman-2002/git-handout/actions/workflows/test_build_app.yml/badge.svg)](https://github.com/Iman-2002/git-handout/actions/workflows/test_build_app.yml)

# Doku CI/CD
*Autor/innen: Iman Hage Hassan, Andrea Maurer, Enes Hanefi*

# Das macht die CI-Pipeline

* klont das Repo
* richtet, Android APK, Flutter und Abhängigkeiten ein
* analysiert den Code mittels flutter analyze (dabei ist code linting integriert)
* testet mit flutter test mit code coverage
* Optional: baut die apk mit flutter
* Optional: lädt die App als Artefact-apk hoch

Zum Testen wurde mit Flutter ein Testprojekt erstellt und in den Branch HelloWorld hochgeladen.
Aktuell wird die CI-Pipeline nur auf diesen Branch bei Push und Pull-Requests angewandt. Sie kann künftig auch auf main angewandt werden. Das ist derzeit auskommentiert. Hier ist im Team beim ersten richtig Projektcode noch abzusprechen, was genau getestet werden soll.

Zusätzlich kann die CI-Pipeline manuell über den Actions-Tabs in GitHub angestartet werden.

# künftige CD-Pipeline
Evtl. soll die apk-Datei später automatisch im Repo zur Verfügung gestellt werden. Weitere Möglichkeiten fürs Deployment sind der Google Playstore sowie der Paketmanager für Flutter.

# Warum GitHub Actions?

GitHub Actions in GitHub integriert, welches wir für unser Projekt verwenden. Keine zusätzliche Integration eines weiteren Dienst wie etwa Jenkins oder ähnliches erforderlich. Einfache Nutzung von GitHub Actions und umfangreiche Funktionen und Anpassungsmöglichkeiten durch weltweite GitHub-Community.