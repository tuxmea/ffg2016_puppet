# Rollen und Profile

Bei Puppet geht es immer um Abstraktion.

Technische Implementierung (provider) werden durch Resourcen abstrahiert.
Resourcen werden in Klassen und Module abstrahiert.

Wie bereits erwaehnt beschreiben Klassen und Module eine technische Komponente.
Hierbei kann man auch fremde Module verwenden (Module Forge, GitHub, ...).

Diese Module muessen an die Infrastrukur angepasst werden. Diese Anpassung wird in Profilen vorgenommen:

    class profile::phpmyadmin {
      class { '::phpmyadmin':
        ...
      }
      apache::vhost { 'localhost':
        ...
      }
    }

    class profile::apache {
      class { '::apache':
        ...
      }
    }

    class profile::apache::php {
      contain profile::apache
      contain apache::mod::php
    }

    class profile::mysql {
      $mysql_root:password = hiera('mysql_root_password')
      class { '::mysql':
        ...
      }
    }

In Profilen hinterlegt man Klassen Deklarationen, Resourcen und Daten Lookups.

Wenn es an die Node Klassifizierung geht, muss man den Blick weg von der Technik richten und den Business-Use-Case eines Systems betrachten.

Beispiel:

PHPMyAdmin mit lokaler Datenbank.

Der Use Case wird durch die Nutzer angegeben: Datenbank Control Panel

Das ist die Rolle des Systems und dies wird bei der Node Klassifizierung angegeben:

    node '<fqdn>' {
      contain role::database_control_panel
    }

Diese Rolle verwendet Profile:

    class role::database_control_panel {
      contain profile::phpmyadmin
      contain profile::apache::php
      contain profile::mysql
    }

In Rollen werden ausschliesslich Profile deklariert.

