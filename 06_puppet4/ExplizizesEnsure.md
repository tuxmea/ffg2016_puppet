# Explizizes Ensure

Bei file Resourcen das ensure Attribut immer explizit angeben:

    file { '/tmp/test':
      ensure => file,
    }

    file { '/tmp/test2':
      ensure => directory,
    }

    file { '/tmp/test3':
      ensure => link,
      target => '/tmp/test2',
    }

    file { '/tmp/test4':
      ensure => absent,
    }

Was macht puppet, wenn ```/tmp/foo``` existiert und ein Verzeichnis ist und folgender Puppet Code angewendet wird:

    file { '/tmp/foo':
      ensure  => present,
      content => 'bar',
    }

