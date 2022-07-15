import 'dart:io';

import 'package:listas_app/utils/list_methods.dart';

void main(List<String> arguments) {
  stdout.write('Inserte el numero de nodos: ');
  final input = stdin.readLineSync();

  final List<dynamic> myList = createList(int.parse(input!));

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

        break;
      case 'b':
      case 'B':
        clearTerminal();
        print('b. Eliminar Nodo');

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
        print('Seleccione una opción valida');
        showMenu();

        break;
    }
  }
}
