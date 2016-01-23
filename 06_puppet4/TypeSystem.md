# Data Type System

Vor Puppet 4 waren nur wenige Daten Typen bekannt:

- Bool
- String
- Arry
- Hash

Puppet 4 hat ein komplettes Daten Typen System:

- Any
    - Scalar
        - Numeric
            - Integer[from, to]
            - Float[from, to]
        - String[from, to]
            - Enum[*strings]
            - Pattern[*patterns]
        - Boolean
        - Regexp[pattern_string]
    - Collection
        - Array[tuple]
        - Hash[key, value]
    - Variant[*types]
    - Optional[type]
    - NotUndef[type]
    - CatalogEntry
        - Resource[type_name, title]
        - Class[class_name]
    - Undef
    - Data
        - Scalar
        - Array[data]
        - Hash[scalar, data]
        - Undef
    - Callable[signature]
    - Type[type]
    - Runtime[runtime_name, class_name]
    - Default

Die Parameter (in eckigen Klammern) sind optional.

Daten Typen kann man bei Parametern (von parametrisierten Klassen) nutzen, oder zur Ueberpruefung einsetzen:

    # parametrisierte Klasse
    class exmaple42_ssh (
      Boolean         $server      = true,
      Boolean         $x11forward  = true,
      Optional[Array] $allow_group = undef,
    ){
      ...
    }

    # Ueberpruefung
    if ( ! $server =~ Boolean) {
      ...
    }
    $server ? { Boolean => true }
    case $server {
      Boolean: { true }
      default: { false }
    }


