# EPP Templates

EPP = Embedded Puppet

Fast so wie ERB (Embedded Ruby)

## ERB

    Welcome to <%= @fqdn %>
    Network Interfaces:
    <% @interfaces.split(',').each do |netwif| -%>
      - <%= netwif %>
    <% end -%>

In Puppet:

    content => template(<template>),
    content => inline_template(<template>),

## EPP

    Welcome to <%= $::fqdn %>
    Network Interfaces:
    <% $::interfaces.split(',').each |String $netwif| { -%>
      - <%= $netwif %>
    <% } -%>

In Puppet:

    content => epp(<template>),
    content => inline_epp(<template>),

## EPP Header (EPP Parameter)

Bei Verwendung der EPP Funktionen können Parameter uebergeben werden:

     epp(<template>, { 'param1' => 'wert1', 'param2' => ['wert2', 'wert3'] })

Diese Parameter muessen im Template an erster Stelle definiert werden:

    <%- |
      String $param1,
      Array $param2
    | -%>
    Information zu param1: <%= $param1 %>
    ...

Diese kann man bei generischen Templates einsetzen.
Generische Templates können so von meheren Modulen verwendet werden.
Ausserdem muss man Parameter in Templates verwenden, wenn man innerhalb eines selbst definierten Resource Typen ein EPP Tempate verwenden will:

    define modul1:test (
      String $param1,
      Array  $arr,
    ){
      file { "/tmp/${name}":
        ensure  => file,
        content => epp('generisch/testfile.epp', { 'param1' => $param1, 'param2' => $arr }),
      }
    }


