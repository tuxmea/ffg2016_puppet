# dont's

## Vererbung

In den meisten Faellen ist Vererbung nicht angebracht.
Oft sind parametrisierte Klassen besser.


## Variablen in der Node Klassifizierung

Variablen, die bei der Node Klassifizierung angegeben werden, liegen im Namensraum des Nodes.
Dieser Namensraum kann nicht angesprochen werden. Man verlaesst sich also auf dynamisches Variablen lookup.
Dieses ist seit Puppet 3 deprecated.


## Module mit Abhaengkeiten

Ein Modul beschreibt einen kleine technische Komponente.
Ein Modul ist eine abgeschlossene Einheit.
Abhaenggkeiten der Infrastruktur werden in den Profilen beschrieben.


