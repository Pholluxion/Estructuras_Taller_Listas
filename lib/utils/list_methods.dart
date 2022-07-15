import 'dart:io';

List<int> createList(int nodes){
  final List<int> myList = [];
  for(int i=0;i<nodes;i++){

    stdout.write('Insert value: ');
    final input = stdin.readLineSync();

    myList.add(int.parse(input!));

  }

  return myList;
}