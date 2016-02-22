# Installation Puppet 3

## Sind Pakete verfuegbar?

Pruefen OS puppet Paket version

- EL: yum info puppet
- Debian: apt-cache show puppet

Wir benoetigen Version 3.8.x

## PuppetLabs repository einbinden:

- EL: https://docs.puppetlabs.com/puppet/3.8/reference/install_el.html
- Debian: https://docs.puppetlabs.com/puppet/3.8/reference/install_debian_ubuntu.html

## System Anforderungen

https://docs.puppetlabs.com/puppet/3.8/reference/pre_install.html

## Agent Installation

Im Workshop wird nur der Agent benoetigt!!!!

Wer den PuppetServer gerne in Betrieb nehmen will, muss berueksichtigen, das sdas System auf dem installiert wird mindestens 2 GB RAM zur Verfuegung hat.

- EL: yum install puppet
- Debian: apt-get install puppet

