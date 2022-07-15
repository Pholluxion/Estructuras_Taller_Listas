import 'dart:io';

import 'package:listas_app/utils/list_methods.dart';

void main(List<String> arguments) {
  stdout.write('Insert number of nodes: ');
  final input = stdin.readLineSync();
  createList(int.parse(input!));
}
