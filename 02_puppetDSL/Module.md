# Module

Zusammenfassung von Puppet Klassen, Konfigurationsdateien und -templates

Hinterlegen von zusätzlicher Funktonalität:

- selbst geschriebe Facts
- selbst entwickelte Functions
- eigene Types und Provider

## Puppet & Module

Währnd man Module (Puppet Code) entwickelt, fängt man zuerstauf einer Test- oder Entwicklungsumgebung an, den Code zu prüfen.

Bei Puppet wird dieser Entwicklungszustand in "environments" abgebildet.

Ein Environment ist ein Verzeichnis auf dem Puppet Server.

Module müssen nnerhalb von Environments im Modulpfad liegen.

Puppet 3: ```/etc/puppet/environments/<name des environment>/modules/```
Puppet 4: ```/etc/puppetlabs/code/environments/<name des environment>/modules/```

Der Environment Pfad kann umkonfiguriert werden:

    # puppet.conf
    [master]
    environmentpath = /etc/puppet/environments

Hinweis: in �lteren Puppet Installationen wurde gerne``` modulepath```anstelle von ```environmentpath``` angegeben. Die Angabe des Module Path soll nicht mehr vorgenommen werden.

## Modulstruktur

    <modulname>
        manifests/
            init.pp             # Hauptklasse
            install.pp          # Subklasse
        files/                  # Ort für statische Konfiguratoinsdateien
        templates/              # Ort für dynamische Konfiguratoinsdateien
        lib/                    # Ort für Erweiterungen
            facter/             # eigene Facts
            puppet/
                parser/
                    functions/  # Puppet 3 API Funktionen
                types/          # eigene Resource Typen
                provider/       # eigene Provider
                functions/      # Puppet 4 API Funktionen
        examples/               # Beispiele für die Nutzung des Modus - Smoke Tests

## Module, Klassen und Namespaces

Ein Modul darf im ```manifests``` Verzeichnis mehrere Klassen haben.

Der Dateiname der Hauptklasse ist vorgegeben. Er muss ```init.pp``` lauten.
Weitere Klassen bekommen den Dateinamen (ohne die Dateiendung) zur Klassen Definition hinzugefügt:

    example42_ssh/
        manifests/
            init.pp             # class example42_ssh {}
            install.pp          # class exmaple42_ssh::install {}
            server.pp           # class example42_ssh::server {}
            server/secure.pp    # class example42_ssh::server::secure {}

Dieses Konzept und das Namensschema sorgt dafür, dass der Puppet Server Klassen automatisch finden kann.

