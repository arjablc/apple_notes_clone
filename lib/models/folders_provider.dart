import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

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
    //However, the Notes folder and the all icloud will always be there
    // ! Hence, in Production these values except the Notes folder
    // ! must be removed
    Folder(folderName: "All iCloud", id: "all-icloud"),
    Folder(folderName: "Notes", id: "notes"),
    Folder(folderName: "Family", id: "family"),
    Folder(folderName: "Home", id: "home"),
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
    switch (folderId) {
      case ("quicknotes"):
        {
          int i = 0, j = 0;
          for (i; i < noteList.length; i++) {
            if (noteList[i].folderId == folderId) {
              j++;
            }
          }
          return j;
        }
      case ("all-icloud"):
        {
          return noteList.length;
        }

      default:
        {
          int i = 0;
          int j = 0;
          for (i; i < noteList.length; i++) {
            if (noteList[i].folderId == folderId) {
              j++;
            }
          }
          return j;
        }
    }
  }

  //getting the folder by id
  Folder getFolderById(String folderId) {
    return _list.firstWhere((element) => element.id == folderId);
  }
}
