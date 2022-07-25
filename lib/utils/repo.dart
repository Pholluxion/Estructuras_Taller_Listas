class Repo {
  String title = '''
=========================
        Menu
=========================
''';

  String titleInsert = '''
==================================================
                  Menu Insert
==================================================
''';
  String titleDelete = '''
==================================================
                  Menu Delete
==================================================
''';

  List<String> opcMenu = [
    'Insertar Nodo',
    'Eliminar Nodo',
    'Buscar Nodo',
    'Tamaño de la Lista',
    'Comprobar Lista Vacía',
    'Mostrar Lista',
    'Vaciar Lista',
    'Salir'
  ];

  List<String> opcInsert = [
    'Insertar Nodo al inicio',
    'Insertar Nodo al final',
    'Insertar Nodo antes del Elemento X',
    'Insertar Nodo después del Elemento X',
    'Salir'
  ];

  List<String> opcDelete = [
    'Eliminar Nodo al inicio',
    'Eliminar Nodo al final',
    'Salir'
  ];

  static final Repo _singleton = Repo._internal();
  factory Repo() => _singleton;
  Repo._internal();
}
