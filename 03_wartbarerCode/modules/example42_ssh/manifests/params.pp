class example42_ssh::param {
    case $::osfmaily {
        'Debian': {
            $pkgname = ['openssh-client', 'openssh-server']
        }
        'RedHat': {
            $pkgname = 'openssh-server'
        }
        default: {
            fail('Das System wird nicht unterstuetzt.)
        }
    }
}
