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
    Folder(folderName: "Folder1", id: UniqueKey().toString()),
    Folder(folderName: "folder2", id: "folder2")
  ];

  //for quick notes
  //instantiaitng a Folder object to store only quick Note
  Folder quickNote = Folder(folderName: "Quick Note", id: "quicknote");

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
    if (folderId == "quicknote") {
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
