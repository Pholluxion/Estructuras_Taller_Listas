import 'dart:io';

List<int> createList(int nodes) {
  final List<int> myList = [];

  clearTerminal();

  for (int i = 0; i < nodes; i++) {
    stdout.write('Inserte valor del nodo [$i]: ');
    final input = stdin.readLineSync();
    myList.add(int.parse(input!));
  }
  clearTerminal();

  return myList;
}

void showList(List<dynamic> myList) {
  stdout.writeln('======' * myList.length);
  stdout.writeln('${'  ' * myList.length}Tú Lista es${' ' * myList.length}');
  stdout.writeln('======' * myList.length);
  for (var element in myList) {
    stdout.write(' [$element] ');
  }
  stdout.writeln('\n${'======' * myList.length}');
}

void showMenu() {
  String menu = '''
\n\n=========================
        Menu
=========================
a. Insertar Nodo
b. Eliminar Nodo
c. Buscar Nodo
d. Tamaño de la Lista
e. Comprobar Lista Vacía
f. Mostrar Lista
g. Vaciar Lista

=========================
  ''';

  stdout.writeln(menu);
}

void clearTerminal() => print("\x1B[2J\x1B[0;0H");

bool insertNode() {
  return true;
}

bool deleteNode(int node, List<dynamic> myList) {
  try {
    myList.removeAt(node);
    return true;
  } catch (e) {
    stdout.writeln('$e\n\n');
    return false;
  } finally {
    showList(myList);
  }
}

dynamic searchNode(int node, List<dynamic> myList) {
  if (myList.length >= node) {
    return myList.elementAt(node);
  }
}

int getLengthList(List<dynamic> myList) => myList.length;

bool checkEmptyList(List<dynamic> myList) => myList.isEmpty;

List<dynamic> setEmptyList() => [];

List<dynamic> insertMenu(List<dynamic> myList) {
  String menu = '''
\n\n=========================
    Menu de inserción
=========================
a. Insertar Nodo al inicio
b. Insertar Nodo al final
c. Insertar Nodo antes del Elemento X
d. Insertar Nodo después del Elemento X
  ''';

  stdout.writeln(menu);

  while (true) {
    stdout.write('---->: ');
    final input = stdin.readLineSync();

    switch (input) {
      case 'a':
      case 'A':
        clearTerminal();
        print('a. Insertar Nodo al inicio');
        stdout.write('Insertar: ');
        final element = int.parse(stdin.readLineSync()!);
        myList.insert(0, element);

        break;
      case 'b':
      case 'B':
        clearTerminal();
        print('b. Insertar Nodo al final');
        stdout.write('Insertar: ');
        final element = int.parse(stdin.readLineSync()!);
        myList.insert(myList.length - 1, element);

        break;
      case 'c':
      case 'C':
        clearTerminal();
        print('Insertar Nodo antes del Elemento X');
        stdout.write('Insertar: ');
        final element = int.parse(stdin.readLineSync()!);
        stdout.write('Antes del elemento: ');
        final elementX = int.parse(stdin.readLineSync()!);
        myList.insert(elementX - 1, element);

        break;
      case 'd':
      case 'D':
        clearTerminal();
        print('Insertar Nodo después del Elemento X');
        stdout.write('Insertar: ');
        final element = int.parse(stdin.readLineSync()!);
        stdout.write('Despues del elemento: ');
        final elementX = int.parse(stdin.readLineSync()!);
        myList.insert(elementX + 1, element);

        break;
      default:
        clearTerminal();

        showList(myList);
        print('\nSeleccione una opción valida');
        showMenu();

        break;
    }
    return myList;
  }
}
