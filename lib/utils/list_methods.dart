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
  stdout.write('${'======' * myList.length}\n');
  stdout.write('${'  ' * myList.length}Tú Lista es${' ' * myList.length}\n');
  stdout.write('${'======' * myList.length}\n');
  for (var element in myList) {
    stdout.write(' [$element] ');
  }

  stdout.write('\n${'======' * myList.length}\n');
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
    stdout.write(e.toString());
    return false;
  } finally {
    showList(myList);
  }
}

bool searchNode() {
  return true;
}

int getLengthList(List<dynamic> myList) {
  return myList.length;
}

bool checkEmptyList(List<dynamic> myList) {
  return myList.isEmpty;
}

List<dynamic> setEmptyList() {
  return [];
}
