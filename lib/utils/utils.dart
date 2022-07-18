import 'dart:io';

import 'package:console/console.dart';
import 'package:listas_app/list_cubit.dart';

final list = ListCubit();

Future<void> printMenu() async {
  list.initList();

  String title = '''
=========================
        Menu
=========================
''';
  Console.init();
  while (true) {
    clearTerminal();
    print("$title\nTu lista es: ${list.state.toString()}\n");
    var chooser = Chooser<String>(
      [
        'Insertar Nodo',
        'Eliminar Nodo',
        'Buscar Nodo',
        'Tamaño de la Lista',
        'Comprobar Lista Vacía',
        'Mostrar Lista',
        'Vaciar Lista',
        'Salir'
      ],
      message: '\nSeleccione una opción: ',
    );
    final opc = chooser.chooseSync();

    if (opc == 'Salir') {
      break;
    }

    switch (opc) {
      case 'Insertar Nodo':
        menuInsert();
        break;
      case 'Eliminar Nodo':
        stdout.write('\nDigite el nodo que desea eliminar: ');
        final input = stdin.readLineSync();
        try {
          list.deleteNode(int.parse(input!));
        } catch (e) {
          print(e);
        }
        break;
      case 'Buscar Nodo':
        try {
          stdout.write('\nDigite el nodo que desea buscar: ');
          final input = stdin.readLineSync();
          stdout.write(
              '\nEl valor del nodo es ${list.searchNode(int.parse(input!))}');
        } catch (e) {
          print(e);
        }
        await Future.delayed(Duration(seconds: 5));
        break;
      case 'Tamaño de la Lista':
        stdout.write('\nEl tamaño de la lista es: ${list.getListSize()}');
        await Future.delayed(Duration(seconds: 5));
        break;
      case 'Comprobar Lista Vacía':
        list.checkList()
            ? stdout.write('\nLa lista esta vacía')
            : stdout.write('\nLa lista no esta vacía');
        await Future.delayed(Duration(seconds: 5));
        break;
      case 'Mostrar Lista':
        list.printList();
        await Future.delayed(Duration(seconds: 5));
        break;
      case 'Vaciar Lista':
        list.emptyList();
        break;
    }
  }
}

void clearTerminal() => print("\x1B[2J\x1B[0;0H");

Future<void> menuInsert() async {
  String title = '''
==================================================
                  Menu Insert
==================================================
''';
  Console.init();
  while (true) {
    clearTerminal();
    print("$title\n Tu lista es: ${list.state.toString()}\n");
    var chooser = Chooser<String>(
      [
        'Insertar Nodo al inicio',
        'Insertar Nodo al final',
        'Insertar Nodo antes del Elemento X',
        'Insertar Nodo después del Elemento X',
        'Salir'
      ],
      message: '\nSeleccione una opción: ',
    );

    final opc = chooser.chooseSync();

    if (opc == 'Salir') {
      break;
    }

    switch (opc) {
      case 'Insertar Nodo al inicio':
        stdout.write('\nDigite el valor del nodo: ');
        final input = stdin.readLineSync();
        try {
          list.insertNodeToInit(int.parse(input!));
        } catch (e) {
          print(e);
        }
        break;
      case 'Insertar Nodo al final':
        stdout.write('\nDigite el valor del nodo: ');
        final input = stdin.readLineSync();
        try {
          list.insertNodeToEnd(int.parse(input!));
        } catch (e) {
          print(e);
        }
        break;
      case 'Insertar Nodo antes del Elemento X':
        try {
          stdout.write('Insertar: ');
          final element = int.parse(stdin.readLineSync()!);
          stdout.write('Antes del elemento: ');
          final elementX = int.parse(stdin.readLineSync()!);
          list.insertNodeBeforeX(element, elementX);
        } catch (e) {
          print(e);
          await Future.delayed(Duration(seconds: 5));
        }

        break;
      case 'Insertar Nodo después del Elemento X':
        try {
          stdout.write('Insertar: ');
          final element = int.parse(stdin.readLineSync()!);
          stdout.write('Despues del elemento: ');
          final elementX = int.parse(stdin.readLineSync()!);
          list.insertNodeAfterX(element, elementX);
        } catch (e) {
          print(e);
          await Future.delayed(Duration(seconds: 5));
        }
        break;
    }
  }
}
