# Migration

min. Puppet 3.8

Directory environments

Code in neues Environment überführen

    #environment.conf
    parser = future

Update Puppet Master

Neue Pfade:

Code: ```/etc/puppetlabs/code```

CA und Zertifikate: ```/etc/puppetlabs/puppet/ssl```

Neuer Puppet Server (JVM)

min 2 GB RAM (+ 2GB PuppetDB)

