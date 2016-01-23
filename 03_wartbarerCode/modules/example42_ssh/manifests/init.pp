class example42_ssh (
    $server = true,
    $x11forward = true,
    $pkgname = $example42_ssh::params::pkgname,
) inherits example42_ssh::params {
    include example42_ssh::install
    include example42_ssh::config
    include example42_ssh::service
}
