# Referenz Syntax

In Puppet 4 muss drauf geachtet werden, dass

- kein Leerzeichen zwischen Resource Referenz und der eckigen Klammer steht und
- der Title in den eckigen Klammern muss
    - Kleinbuchstane und in Anfuehrungzeichen sein oder
    - eine Variable sein

Fehler:

    require => File ['/tmp']
    require => File[Tmp]

