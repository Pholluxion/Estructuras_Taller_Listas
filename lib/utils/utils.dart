import 'dart:io';

import 'package:console/console.dart';
import 'package:listas_app/list_cubit.dart';
import 'package:listas_app/utils/repo.dart';

final list = ListCubit();
final _repo = Repo();

Future<void> printMenu() async {
  list.initList();
  // list.initRandomList();
  Console.init();

  while (true) {
    _clearTerminal();
    _printTitle(_repo.title);

    final opc = _initChooser(_repo.opcMenu);

    if (opc == 'Salir') {
      break;
    }
    _executeOpc(opc);
    await Future.delayed(Duration(seconds: 4));
  }
}

Future<void> _menuInsert() async {
  while (true) {
    _clearTerminal();
    _printTitle(_repo.titleInsert);

    final opc = _initChooser(_repo.opcInsert);

    if (opc == 'Salir') {
      break;
    }

    _executeOpcInsert(opc);
  }
}

Future<void> _menuDelete() async {
  while (true) {
    _clearTerminal();
    _printTitle(_repo.titleDelete);

    final opc = _initChooser(_repo.opcDelete);

    if (opc == 'Salir') {
      break;
    }

    _executeOpcDelete(opc);
  }
}

void _printTitle(String title) =>
    stdout.write("$title \nTu lista es: ${list.state.toString()}\n\n");

String _initChooser(List<String> opc) {
  var chooser = Chooser<String>(
    opc,
    message: '\nSeleccione una opción: ',
  );
  return chooser.chooseSync();
}

void _clearTerminal() => print("\x1B[2J\x1B[0;0H");
// void _clearTerminal() => print("\n");

void _executeOpc(String opc) {
  switch (opc) {
    case 'Insertar Nodo':
      _menuInsert();
      break;
    case 'Eliminar Nodo':
      _menuDelete();
      break;
    case 'Buscar Nodo':
      try {
        stdout.write('\nDigite el elemento que desea buscar: ');
        final input = stdin.readLineSync();
        list.searchNode(input);
      } catch (e) {
        print(e);
      }
      break;
    case 'Tamaño de la Lista':
      stdout.write('\nEl tamaño de la lista es: ${list.getListSize()}');
      break;
    case 'Comprobar Lista Vacía':
      stdout.write('\n${list.checkList()}');
      break;
    case 'Mostrar Lista':
      list.printList();
      break;
    case 'Vaciar Lista':
      list.emptyList();
      break;
  }
}

void _executeOpcInsert(String opc) async {
  switch (opc) {
    case 'Insertar Nodo al inicio':
      stdout.write('\nDigite el valor del nodo: ');
      final input = stdin.readLineSync();
      try {
        list.insertNodeToInit(input);
      } catch (e) {
        print(e);
      }
      break;
    case 'Insertar Nodo al final':
      stdout.write('\nDigite el valor del nodo: ');
      final input = stdin.readLineSync();
      try {
        list.insertNodeToEnd(input);
      } catch (e) {
        print(e);
      }
      break;
    case 'Insertar Nodo antes del Elemento X':
      try {
        stdout.write('Insertar: ');
        final element = stdin.readLineSync();
        stdout.write('Antes del elemento: ');
        final elementX = stdin.readLineSync();
        list.insertNodeBeforeX(element, elementX);
      } catch (e) {
        print(e);
        await Future.delayed(Duration(seconds: 5));
      }

      break;
    case 'Insertar Nodo después del Elemento X':
      try {
        stdout.write('Insertar: ');
        final element = stdin.readLineSync();
        stdout.write('Despues del elemento: ');
        final elementX = stdin.readLineSync();
        list.insertNodeAfterX(element, elementX);
      } catch (e) {
        print(e);
        await Future.delayed(Duration(seconds: 5));
      }
      break;
  }
}

void _executeOpcDelete(String opc) async {
  switch (opc) {
    case 'Eliminar Nodo al inicio':
      list.deleteNodeInit();
      break;
    case 'Eliminar Nodo al final':
      list.deleteNodeEnd();
      break;
  }
}
