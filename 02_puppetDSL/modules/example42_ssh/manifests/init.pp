class exmaple42_ssh {
    package { 'openssh':
        ensure => present,
    }
    file { '/etc/ssh/sshd_config':
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        require => Package['openssh'],
    }
    service { 'ssh':
        ensure    => running,
        enable    => true,
        subscribe => File['/etc/ssh/sshd_config'],
    }
}
