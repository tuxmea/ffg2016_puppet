class example42_ssh (
    $server = true,
    $x11forward = true,
    $pkgname = $example42_ssh::params::pkgname,
    $svcname = $example42_ssh::params::svcname,
) inherits example42_ssh::params {
  package { $pkgname:
    ensure => present,
  }
  file { '/etc/ssh/sshd_config':
    ensure  => file,
    require => Package[$pkgname],
  }
  service { $svcname:
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/ssh/sshd_config'],
  }
}
