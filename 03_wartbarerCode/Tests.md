# Tests

## Unit Tests

Unit tests will compilea catalog in a sandbox. THe content of the catalog is then compared with the tests

Abhängigkeiten:

- gcc
- make
- libgmp-dev

Notwendige Dateien im Puppet Modul:

- Gemfile
- Rakefile
- .fixtures.yml
- spec/spec_helper.rb
- spec/classes/<test>_spec.rb

Auf Ruby Version achten:

Puppet 3.8 -> Ruby 1.9.3

Puppet 4.3 -> Ruby 2.1.7

Ruby Erweiterungen (Gems) installiert man idealerweise in einem neuen Pfad und nicht im System. Dazu nutzt man ```bundler```

    bundle install --path vendor

Danach können die Rake Taks ausgeführt werden:

    bundle exec rake -T   # Liste alle Rake Tasks
    bundle exec rake spec # Spec Tests


## Integration Tests

Beaker integriert Vagrant + ServerSpec

Abhängigkeiten:

- libxml-dev


