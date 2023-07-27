import 'package:flutter/cupertino.dart';

class Notes {
  final String id = UniqueKey().toString();
  final String content;
  final String folderId;
  final DateTime timeOfCreation;

  Notes({
    required this.content,
    required this.folderId,
    required this.timeOfCreation,
  });

//Since the title of a note is not passed in the ios notes app
//rather it is first parts of the note
//we are going to generate the title ourselves
  String get generateNoteTitle {
    String title = '';
    List tempList = content.split(' ');
    tempList.map((e) => title = title + e);
    return title;
  }
}

class NotesDataProvider with ChangeNotifier {
  final List<Notes> _list = [
    Notes(
        content: "some content",
        folderId: "quicknote",
        timeOfCreation: DateTime.now()),
    Notes(content: "adsfa", folderId: "family", timeOfCreation: DateTime.now()),
    Notes(
        content: "Hello darkness My old friend",
        folderId: "family",
        timeOfCreation: DateTime.now())
  ];
  List<Notes> get notesList => [..._list];

  List<Notes> getFolderedNoets(String folderId) {
    List<Notes> folderedNotes = [];
    folderedNotes =
        _list.where((element) => folderId == element.folderId).toList();
    return folderedNotes;
  }
}
