import 'package:flutter/cupertino.dart';

class Notes {
  final String title;
  final String id = UniqueKey().toString();
  final String content;
  final String folderId;

  Notes({
    required this.title,
    required this.content,
    required this.folderId,
  });
}

class NotesDataProvider with ChangeNotifier {
  final List<Notes> _list = [
    Notes(title: "some title", content: "some content", folderId: "quicknote"),
    Notes(title: "adfadsf", content: "adsfa", folderId: "folder2")
  ];
  List<Notes> get notesList => [..._list];
}
