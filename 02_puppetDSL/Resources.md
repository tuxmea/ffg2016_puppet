# Puppet DSL - Resources

## Auslesen:

    puppet resource user root

## Deklarieren:

    # /root/puppet/resources.pp
    group { 'admins':
      ensure => present,
    }
    user { 'martin':
      ensure => present,
      gid    => 'admins',
      shell  => '/bin/bash',
      home   => '/home/martin',
    }
    file { '/home/martin/.ssh':
      ensure => directory,
    }

## Reihenfolge - Metattribute

    # /root/puppet/ssh.pp
    package { 'openssh-server':
      ensure => present,
    }
    file { '/etc/ssh/sshd_config':
      ensure  => file,
      require => Package['openssh-server'],
    }
    service { 'sshd':
      ensure    => running,
      enable    => true,
      subscribe => File['/etc/ssh/sshd_config'],
    }

## Reihenfolge - Chaining

    # /root/puppet/apache.pp
    package { 'httpd':
      ensure => present,
    }
    file { '/etc/httpd/conf/httpd.conf':
      ensure => file,
    }
    service { 'httpd':
      ensure => running,
      enable => true,
    }
    Package['httpd'] -> File['/etc/httpd/conf/httpd.conf'] ~> Service['httpd']


## Anwenden

    puppet apply <dateiname>

Beispiel:

    puppet apply /root/puppet/resources.pp

