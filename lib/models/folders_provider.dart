import 'package:flutter/cupertino.dart';

class Folders with ChangeNotifier {
  final String folderName;
  String id = UniqueKey().toString();

  Folders({required this.folderName});
}

class FoldersListProvider with ChangeNotifier {
  final List<Folders> _list = [
    Folders(folderName: "Quck Notes"),
  ];
  List<Folders> get _foldersList => [];
}
