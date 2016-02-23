class example42_ssh::params {
    case $::osfamily {
        'Debian': {
            $pkgname = ['openssh-client', 'openssh-server']
            $svcname = 'ssh'
        }
        'RedHat': {
            $pkgname = 'openssh-server'
            $svcname = 'sshd'
        }
        default: {
            fail('Das System wird nicht unterstuetzt.')
        }
    }
}
