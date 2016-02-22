# Tests

## Unit Tests

Unit compilieren einen Katalog in einer Sandbox. Der Inhalt des Kataloges wird dann mit den Tests abgeglichen.

Abhaengigkeiten:

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

Danach koennen die Rake Taks ausgefuehrt werden:

    bundle exec rake -T   # Liste alle Rake Tasks
    bundle exec rake spec # Spec Tests


## Integration Tests

Beaker integriert Vagrant + ServerSpec

Abhaengigkeiten:

- libxml-dev


