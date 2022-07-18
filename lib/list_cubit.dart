import 'dart:io';

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
    final int index = state.indexOf(x);
    state.insert((index), value);
    emit(state);
  }

  void insertNodeAfterX(dynamic value, dynamic x) {
    final int index = state.indexOf(x);
    state.insert((index + 1), value);
    emit(state);
  }

  void deleteNode(int node) {
    if (node == 0) {
      return;
    }

    state.removeAt(node - 1);
    emit(state);
  }

  dynamic searchNode(int node) {
    if (node > state.length || node < 0) {
      return;
    }
    return state.elementAt(node - 1);
  }

  int getListSize() => state.length;

  bool checkList() => state.isEmpty;

  void printList() {
    for (var element in state) {
      stdout.write(' [$element] ');
    }
  }

  void emptyList() => emit([]);

  void initList() {
    stdout.write('Digite el numero de nodos: ');
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
}
