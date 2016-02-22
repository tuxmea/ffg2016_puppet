# Logische Gruppierung

Resourcen in der Reihenfolge deklarieren, wie sie von Puppet abgearbeitet werden sollen
Normalerweise entspricht das auch der Reihenfolge, in der man das manuell macht.

Hintergrund:

## puppet.conf - ordering

Default in Puppet 4:

    ordering = manifests

Default vorher:

    ordering = title-hash

Weitere Moeglichkeit:

    ordering = random
