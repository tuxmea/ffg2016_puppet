# HereDoc

Puppet 4 kennt jetzt die HEREDOC Notation.
Diese funktioniert analog zur Shell:

Das Ende Tag wird durch ein @ Zeichen gekennzeichnet und in Klammern gesetzt:

    $content = @(EOF)
    Das ist eine Zeile.
    Das ist noch eine Zeile.
    EOF

Wenn innerhalb des HEREDOC Dokumentes Variablen ersetzt werden sollen, dann wird der Name des Ende Tags in doppelte Anfuehrungszeichen gesetzt:

    $content = @("EOF")
    Hier steht der FQDN: $::fqdn
    Und eine zweite Zeile.
    EOF

Ausserdem kann man festlegen, bei welchem Zeichen die Einrückung starten sol. Dies wird durch ein Pipe Zeichen definiert.
Idealerweise setzt man das Pipe Zeichen an das Ende Tag.

    $content = @(EOF)
      Diese Zeile beginnt ganz am Anfang
        Diese hat zwei Leerzeichen
      | EOF

Zusätzlich kann man Escape Sequenzen nutzen. Die verwendeten Escape Sequenzen muessen bei der Definition des Ende Tags mit angegeben werden:

    $content = @(EOF\t)
      Diese Zeile beginnt am Anfang
      \tDiese Zeile ist einen Tab eingerueckt
      | EOF


