import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';

class ListCubit extends Cubit<List<dynamic>> {
  ListCubit() : super([]);

  void insertNodeToEnd(dynamic value) {
    state.add(value);
    emit(state);
  }

  void insertNodeToInit(dynamic value) {
    state.insert(0, value);
    emit(state);
  }

  void insertNodeBeforeX(dynamic value, dynamic x) {
    List<int> indexList = [];
    int i = 0;
    for (var element in state) {
      if (element == x) {
        indexList.add(i);
      }
      i++;
    }

    i = 0;

    for (var index in indexList) {
      state.insert(index + i, value);
      i++;
    }

    emit(state);
  }

  void insertNodeAfterX(dynamic value, dynamic x) {
    List<int> indexList = [];
    int i = 0;
    for (var element in state) {
      if (element == x) {
        indexList.add(i);
      }
      i++;
    }

    i = 0;

    for (var index in indexList) {
      state.insert((index + 1) + i, value);
      i++;
    }

    emit(state);
  }

  void deleteNodeInit() {
    state.removeAt(0);
    emit(state);
  }

  void deleteNodeEnd() {
    state.removeLast();
    emit(state);
  }

  dynamic searchNode(dynamic val) {
    List<int> index = [];
    int i = 0;
    for (dynamic value in state) {
      if (value.toString() == val) {
        index.add(state.indexOf(value, i) + 1);
      }
      i++;
    }
    if (index.isNotEmpty) {
      stdout.write(
          '\nLa posición numérica donde está el nodo en la lista: $index');
    } else {
      stdout.write('\nLa lista no contiene el elemento');
    }
  }

  int getListSize() => state.length;

  bool checkList() => state.isEmpty;

  void printList() {
    stdout.writeln();
    stdout.writeln("------" * state.length);
    stdout
        .writeln("${"   " * (state.length)}Tu lista${"   " * (state.length)}");
    stdout.writeln("------" * state.length);

    for (var element in state) {
      stdout.write(' [$element] ');
    }
    stdout.writeln();
    stdout.writeln("------" * state.length);
  }

  void emptyList() => emit([]);

  void initList() {
    stdout.write('\nDigite el numero de nodos: ');
    final input = stdin.readLineSync();

    try {
      int nodes = int.parse(input!);
      for (int i = 0; i < nodes; i++) {
        stdout.write('Inserte valor del nodo [${i + 1}]: ');
        final input = stdin.readLineSync();
        state.add(input);
        emit(state);
      }
    } catch (e) {
      print(e);
    }
  }

  /// Código = 2172336
  /// N = (último dígito del código de estudiante) * 3 = (6)*3
  /// N =  18

  void initRandomList() {
    const N = 6 * 3;
    final rand = Random();

    stdout.writeln('\nNumero de nodos: $N');

    for (int i = 0; i < N; i++) {
      final val = rand.nextInt(100);
      stdout.write('\nValor del nodo [${i + 1}]: $val');
      state.add(val);
      emit(state);
    }
  }
}
