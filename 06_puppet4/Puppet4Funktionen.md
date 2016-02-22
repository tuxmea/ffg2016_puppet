# Puppet 4 Funktionen

## Puppet 3 Funktionen

    <modulepath>/lib/puppet/parser/functions/<funktionsname>.rb

Flache Namenshierarchy

    stdlib/lib/puppet/parser/functions/base64.rb
    modul1/lib/puppet/parser/functions/app_call.rb
    modul1/lib/puppet/parser/functions/base64.rb

    $encode = base64($decode)

## Puppet 4 Funktionen

    <modulepath>/lib/puppet/functions/<funktionsname>.rb
    <modulepath>/lib/puppet/functions/<namespace>/<funktionsname>.rb

Funktionen koennen jetzt Namenraeume nutzen (zwingend empfohlen!)

    modul1/lib/puppet/functions/modul1/base42.rb

    $encode = modul1::base64($decode)

Funktionen mit post-fix Notation

    $symlinks.each
    each($symlinks)

Funktionen und Lambdas

    $var.func |Lambda| {
      Block
    }

    $symlinks.each |$link| {
      file { "/usr/local/bin/${link}":
        ensure => link,
        target => "/opt/application/bin/${name}",
      }
    }

Lambdas kennen Daten Typen

    $symlinks.each | String $link| {
      # ...
    }

Funktionen kennen Daten Typen

    require 'base64_string'
    Puppet::Functions.create_function(:'modul1::base64') do
      dispatch :encoded do
        param 'Pattern[.*=\\n$]', :code
      end
      dispatch :decoded do
      end

      def encoded
        code.decode64
      end
      def decoded
        code.encode64
      end
    end


