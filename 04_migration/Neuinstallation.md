# Neuinstallation

neuer Puppet Server (min 4 GB RAM (2GB Puppet Server, 2 GB PuppetDB)

CA kopieren

Nodes umkonfigurieren:

    # puppet.conf
    [agent]
    ca_server = <neuer Puppet Server>
    server = <alter Puppet Master>

alten Master Umkonfigurieren:

    # puppet.conf
    [master]
    ca = false
    ca_sever = <neuer Puppet Server>

