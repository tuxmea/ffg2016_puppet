# Params Pattern

## Parametrisierte Klassen

Wenn man das Verhalten des Puppet Code verändern möchte, dann werden einer Klasse Parameter deklariert.
Die Parameter sollten nur in der Hauptklasse deklariert werden.

Man kann eine arametrisierte Klasse wie eine API betrachten.
Je nach Uebergabeparameter verhallt sich die Klasse unterschiedlich.

Parametrisierte Klassen werden z.B. zur Code Deduplizierung eingesetztt

    class example42_ssh (
      $server     = true,
      $client     = true,
      $allow_root = true,
      $x11forward = true,
    ){
      File {
        owner => 'root',
        group => 'root',
        mode  => '0440',
      }
      if $server {
        include example42_ssh::server
        file { '/etc/ssh/sshd_config':
          ensure  => file,
          content => template('example42_ssh/sshd_config.erb'),
        }
      }
      if $client {
        contain example42_ssh::client
        file { '/etc/ssh/ssh_config':
          ensure  => file,
          content => template('example42_ssh/ssh_config.erb'),
        }
      }
    }

Die Deklaration von Parametrisierten Klassen kann auf folgende Weise realisiert werden:

1. Default Werte nutzen (Default werden wüssen gesetzt sein

    include example42_ssh

oder

    contain example42_ssh

2. Default Werte nutzen, Klasse als Resource Type ansehen

    class { 'example42_ssh': }

3. Klasse als Resource Typ, Parameter setzen:

    class { 'example42_ssh':
      $server     => false,
      $x11forward => false,
    }


## Params Pattern

Eventuell muss man Puppet Code für unterschiedliche Betriebssysteme anpassen.
Idealerweise nutzt man dafür Variablen:

    class example42_ssh (
      $server = true,
      $client = true,
    ){
      case $::osfamily {
        'Debian': {
          $pkgname = ['openssh-client','openssh-server']
          $svcname = 'ssh'
        }
        'RedHat': {
          $pkgname = ...
          $svcname = ...
        }
      }
      package { $pkgname:
        ensure => present,
      }
      service { $svcname:
        ensure => runing,
      }
    }

Das Setzen der Variablen lenkt vom Puppet Code ab.
Deshalb wird dieser Teil gerne in eine Subklasse (params.pp) ausgelagert.

 
    class example42_ssh::params (
    ){
      case $::osfamily {
        'Debian': {
          $pkgname = ['openssh-client','openssh-server']
          $svcname = 'ssh'
        }
        'RedHat': {
          $pkgname = ...
          $svcname = ...
        }
      }
    }

    class example42_ssh (
      $server = true,
      $client = true,
    ){
      include example42_ssh::params
      package { $example42_ssh::params::pkgname:
        ensure => present,
      }
      service { $example42_ssh::params::svcname:
        ensure => runing,
      }
    }

Wenn man dem Anwender ermöglichen will, eigene Pakete oder Service Namen anzugeben, dann m�üssen die OSVariablen als Parameter hinterlegt werden.
Als Default sollen die Werte aus der params Subklasse genutzt werden.
Damit der Inhalt der params.pp bereits im Parameter block (also bevor die Klassedefinition beginnt) verfügbar ist, muss vererbt werden.

Dies ist aktuell der einzige zulässie Einsatz für Vererbung in Puppet:


    class example42_ssh::params (
    ){
      case $::osfamily {
        'Debian': {
          $pkgname = ['openssh-client','openssh-server']
          $svcname = 'ssh'
        }
        'RedHat': {
          $pkgname = ...
          $svcname = ...
        }
      }
    }

    class example42_ssh (
      $pkgname = $example42_ssh::params::pkgname,
      $svcname = $example42_ssh::params::svcname,
      $server  = true,
      $client  = true,
    ) inherits example42_ssh::params {
      package { $pkgname:
        ensure => present,
      }
      service { $svcname:
        ensure => runing,
      }
    }


