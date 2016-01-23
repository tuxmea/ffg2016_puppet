# dont's

## Vererbung

In den meisten Fällen ist Vererbung nicht angebracht.
Oft sind parametrisierte Klassen besser.


## Variablen in der Node Klassifizierung

Variablen, die bei der Node Klassifizierung angegeben werden, liegen im Namensraum des Nodes.
Dieser Namensraum kann nicht angesprochen werden. Man verlässt sich also auf dynamisches Variablen lookup.
Dieses ist seit Puppet 3 deprecated.


## Module mit Abhängkeiten

Ein Modul beschreibt einen kleine technische Komponente.
Ein Modul ist eine abgeschlossene Einheit.
Abhänggkeiten der Infrastruktur werden in den Profilen beschrieben.


