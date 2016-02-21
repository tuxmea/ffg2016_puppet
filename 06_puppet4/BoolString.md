# Bool und String

Puppet 4 kennt Daten Typen.
Davon abgesehen hat sich eine BoolscheLogik in Puppet 4 geaendert.

    if $string {
    } else {
    }

Das Ergebnis is wahr, wenn $string:
  - den boolschen Wert true hat
  - ein beliebiger Inhalt ist

Das Ergebnis ist falsch, wenn $string
  - den boolschen Wert false hat
  - ein leerer String ist
  - nicht definiert ist

In Puppept 4 liefert die Pruefung auf einen leeren String anstelle von false, true zurueck.

