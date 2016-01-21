# Puppet DSL - Klassen

Zusammenfassung von Resourcen

Beschreibung einer kleinen technischen Einheit

Beispiele für Module:

- ntp
- ssh
- ldap
- kerberos
- apache
- php
- mysql
- postgresql
- firewall

Eigene Module sollten ein Prefix bekommen:

- my_ntp
- example42_ssh
- team_ops_git
- team_dev_git

Klassennamen dürfen kein Minuszeichen enthalten !

## Klassen definition

    class example42_ssh {
      package { 'openssh':
        ensure => present,
      }
      file { 'sshd_config':
        ensure  => file,
        path    => '/etc/ssh/sshd_config',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        require => Package['openssh'],
      }
      service { 'ssh':
        ensure => running,
        enable => true,
      }
    }

## Klassen deklaration

    include example42_ssh

Achtung: damit Klassen auf dem Puppet Server autoamtisch gefunden werden, müssen diese in Modulen hinterlegt werden.

