# Node Vererbung

    node basenode {
      include security
      include users
    }

    node 'www.example.com' inherits 'basenode' {
      include www
    }

Node Vererbung geht nicht mehr !!!!

Statt dessen Rollen und Profile verwenden.

## Rollen und Profile

Generell kann man sagen, dass es bei Puppet immer um Abstraktion geht:

- Resource Typen abstrahieren die technische Implementierung
- Klassen abstrahieren Resourcen (technische Komponenten Module)
- Profile abstrahieren Klassen (Implementierung)
- Rollen abstrahieren Profile (Business Use Case)

Technische Komponenten Module wird man sich oft von GitHub oder der Module Forge holen.
Diese Module sind so generisch, dass man Sie fuer den Einsatz auf der eigenen Plattform anpassen muss.
Diese Anpassung (oder Implementierung) erfolgt mit Hilfe von Profilen.
Eine Rolle beschreibt den Sinn und Zweck eines System (Business Use Case) und verwendet die Implementierungs Profile.

In Profilen werden
- Klassen deklariert
- Daten Lookups durchgefuehrt
- vereinzelt Resourcen delariert

In Rollen werden
- Profile deklariert
- keine Daten Lookups
- keine Resource Deklarationen


