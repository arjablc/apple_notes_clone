import 'package:flutter/cupertino.dart';

import 'notes_provider.dart';

class Folder {
  String folderName;
  int notesNumber = 0;
  final String id;

  Folder({required this.folderName, required this.id});
}

class FolderDataProvider with ChangeNotifier {
  final List<Folder> _list = [
    //Some of the notes here are provided
    //hardcoded folderId for demonstration
    //purposes
    //However, the Notes folder will always be there
    // !Hence in Production these values except the Notes folder
    // !must be removed
    Folder(folderName: "Notes", id: "notes"),
    Folder(folderName: "Family", id: "family"),
    Folder(folderName: "Home", id: "home")
  ];

  //for quick notes
  //instantiaitng a Folder object to store only quick Note
  Folder quickNote = Folder(folderName: "Quick Notes", id: "quicknotes");

  //returning the list of folder
  List<Folder> get folderList => [..._list];

//addidng new folder
  void addNewFolder(Folder folder) {
    if (_list.contains(folder)) {
      return;
    }
    _list.add(folder);
    notifyListeners();
  }

  //removing a folder, deleting it
  void deleteFolder(Folder folder) {
    if (!_list.contains(folder)) {
      return;
    }
    _list.remove(folder);
    notifyListeners();
  }

  //update the folders
  void updateFolders(Folder oldFolder, String newFolderName) {
    final currentFolder =
        _list.firstWhere((element) => element.id == oldFolder.id);
    currentFolder.folderName = newFolderName;
    notifyListeners();
  }

  //update folder note count
  int updateFolderNotecount(List<Notes> noteList, String folderId) {
    int i = 0, j = 0;
    if (folderId == "quicknotes") {
      for (i; i < noteList.length; i++) {
        if (noteList[i].folderId == folderId) {
          j++;
        }
      }
      return j;
    }
    i = 0;
    j = 0;
    for (i; i < noteList.length; i++) {
      if (noteList[i].folderId == folderId) {
        j++;
      }
    }
    return j;
  }
}
