import 'dart:io';

import 'package:listas_app/utils/list_methods.dart';

void main(List<String> arguments) {
  stdout.write('Digite el numero de nodos: ');
  final input = stdin.readLineSync();

  List<dynamic> myList = createList(int.parse(input!));

  clearTerminal();

  showList(myList);
  showMenu();

  while (true) {
    stdout.write('---->: ');
    final input = stdin.readLineSync();

    switch (input) {
      case 'a':
      case 'A':
        clearTerminal();
        print('a. Insertar Nodo');
        myList = insertMenu(myList);
        break;
      case 'b':
      case 'B':
        clearTerminal();
        print('b. Eliminar Nodo');
        stdout.write('Digite el nodo que desea eliminar: ');
        final input = stdin.readLineSync();
        deleteNode(int.parse(input!), myList);

        break;
      case 'c':
      case 'C':
        clearTerminal();
        print('c. Buscar Nodo');

        break;
      case 'd':
      case 'D':
        clearTerminal();
        print('d. Tamaño de la Lista');

        break;
      case 'e':
      case 'E':
        clearTerminal();
        print('e. Comprobar Lista Vacía');

        break;
      case 'f':
      case 'F':
        clearTerminal();
        print('f. Mostrar Lista');

        break;
      case 'g':
      case 'G':
        clearTerminal();
        print('g. Vaciar Lista');

        break;
      default:
        clearTerminal();

        showList(myList);
        print('\nSeleccione una opción valida');
        showMenu();

        break;
    }
  }
}
