import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Notes {
  final String id = UniqueKey().toString();
  String content;
  final String folderId;
  final DateTime _dateTime = DateTime.now();

  Notes({
    required this.content,
    required this.folderId,
  });

//Since the title of a note is not passed in the ios notes app
//rather it is first parts of the note
//we are going to generate the title ourselves
  String get generateNoteTitle {
    if (content.length < 50) {
      return content;
    }
    return '${content.substring(0, 50)}...';
  }

// This generates the subtitle of the note
// This generates the subtitle of the note
//what I want ?
//To be able to shwo No additional text is the content is smaller than 50
//But the problem is that the new line is taking

  String get generateSubtitle {
    if (content.length < 50) {
      return 'No additional text';
    }

    String unFormatedSubtitle =
        content.substring(50, min(content.length - 1, 75));
    List<String> subtitleWordsList =
        unFormatedSubtitle.replaceAll("\n", " ").split(' ');
    List<String> subListFromSecondWord =
        subtitleWordsList.sublist(2, subtitleWordsList.length);
    String subtitleText = subListFromSecondWord.join(' ').trim();
    debugPrint(subtitleText);
    return unFormatedSubtitle;
  }

//getter for formated date and time of creation of note
  String get timeOfCreation => DateFormat("yyyy/mm/dd").format(_dateTime);
}

class NotesDataProvider with ChangeNotifier {
  final List<Notes> _list = [
    Notes(
      content: "some content",
      folderId: "quicknotes",
    ),
    Notes(
      content: "adsfa",
      folderId: "family",
    ),
    Notes(
      content:
          "Hello darkness My old friend I have come to meet you once again and here I am that you don't know ",
      folderId: "family",
    ),
    Notes(
      content:
          "lfasdjklfjasdfl;ajsdlf asdlkfjasdpofias jdfaldjfkal;sdfj asdfkj adsfpoasdfl;kj",
      folderId: "family",
    ),
  ];
  List<Notes> get notesList => [..._list];
//This method provides the notes that have a specific folder id
  List<Notes> getNotesByFolderId(String folderId) {
    if (folderId == 'all-icloud') {
      return notesList;
    }

    return _list
        .where(
          (element) => element.folderId == folderId,
        )
        .toList();
  }

  //add new note
  void addNewNote(Notes newNote) {
    _list.add(newNote);
    notifyListeners();
  }

  //update existing Note
  void updateExistingNote(String content, Notes oldNote) {
    int oldNoteIndex = _list.indexOf(oldNote);
    _list[oldNoteIndex].content = content;
    notifyListeners();
  }

  //Note by id
  Notes getNoteById(String id) {
    return _list.firstWhere((element) => element.id == id);
  }
}
