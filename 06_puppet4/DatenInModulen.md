# Daten in Modulen

Das Thema wird "Daten in Modulen" genannt, ist aber gleichlautend fuer "Daten in Environments"
Daten in Module richtet sich primaer an Modul Entwickler, Daten in Environments richtet sich an Modul Nutzer.

## Problembeschreibung

Eine parametrisierte Klasse (params Pattern), die auf OS Spezifika eingeht und als Default die fail Funktion aufruft:

    class modul1::params {
      case $::fact['os'['family'] {
        'Debian': {
          $pkgname = 'modul'
        }
        'RedHat': {
          $pkgname = 'modul-service'
        }
        default: {
          fail('Das OS wird nicht unterstuetzt')
        }
      }
    }

    class modul1 (
      $pkgname = $modul1::params::pkgname,
    ) inherits modul1::params {
      # ...
    }

Dieser Aufbau folgt den gaengigen Best Practices.
Die Hauptklasse erlaubt es, Parameter zu setzen, welche als Default Wert auf die params Subklasse zurueckgreifen.

In Kombination mit "automatic Databinding" kann man nun die Parameter unter Angabe des Namensraumes in Hiera hinterlegen.
Puppet wird diese dann automatisch finden:

    modul1::pkgname: 'modul-neu'

Innerhalb von Hiera kann man Daten Hierarchien ueber beliebige Facts erzeugen.
So z.B. auch ueber OSFamily

    # hiera.yaml
    :backend: yaml
    :hierarchy:
      "node/%{::certname}"
      "os/%{::osfamily}"
      common

Der naechste Nutzer des Moduls moechte gerne FreeBSD einsetzen.
Er legt die Datei ```os/BSD.yaml``` an.

    modul1::pkgname: 'modul-bsd'

Der Agent Lauf wird eine Fehlermeldung bringen, da in der params.pp Klasse kein Eintrag fuer BSD erfolgt ist.
Der Nutzer muss das Modul patchen (und hoffentlich nach Upstream einen Pull-Request erstellen).

## Loesungsansatz:

Anstelle der params Klasse hinterlegt man im Modul eine Hiera Daten Hierarchie.
Da jedes Setup sich in der Hierarchie unterscheidet, muss eine neue hiera.yaml Datei im Modul hinterlegt werden.
Diese hiera.yaml Datei muss hiera v4 referenzieren.

    # modul1/hiera.yaml
    ---
    version: 4
    datadir: data
    hierarchy:
      - name: "Nodes"
        backend: yaml
        path: "node/%{::certname}"
      - name: "OS"
        backend: yaml
        path: "os/%{::osfamily}
      - name: "common"
        backend: yaml

Nun muss man alle Daten in Hiera in das data Verzeichnis im Modul hinterlegen.
Die params Klasse kann geloescht werden.
Die Vererbung aus der Hauptklasse kann raus, die Default Werte, die sich auf die params Subklasse beziehen koennen raus.

    class modul1 (
      $pkgname,
    ) {
      # ...
    }

Jetzt muss man Puppet mitteilen, dass fuer dieses Modul das Konzept von Daten in Modulen verwendet werden soll.
Module haben keine Konfigurationsdateien.
Aber es gibt das Konzept einer metadata.json Datei, die fuer Uploads zur Puppet Forge zwingend notwendig ist.
In dieser Datei wird ein Eintrag hinzugefuegt:

    data_provider: 'hiera',

Fuer Eenvironments nutzt man die environment.conf Datei oder man hinterlegt das Data Lookup global in die puppet.conf Datei.

Der BSD Nutzer legt einfach seine Daten in sein Environment.

Das Konzept von Daten in Environments wird gerne in Kombination mit R10K verwendet.

