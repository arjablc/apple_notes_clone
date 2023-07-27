import 'package:apple_notes_clone/models/folders_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:apple_notes_clone/models/notes_provider.dart';
import 'package:apple_notes_clone/widgets/custom_back_button.dart';

class EditViewPage extends StatelessWidget {
  const EditViewPage({
    Key? key,
    required this.noteId,
    required this.folderId,
    required this.isNewNote,
  }) : super(key: key);
  final String noteId;
  final String folderId;
  final bool isNewNote;

  void navigateBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    Folder currentFolder =
        Provider.of<FolderDataProvider>(context, listen: false)
            .getFolderById(folderId);
    Notes currentNote = isNewNote
        ? Notes(content: '', folderId: 'quicknotes')
        : Provider.of<NotesDataProvider>(context)
            .notesList
            .firstWhere((element) => element.id == noteId);
    return Scaffold(
      appBar: AppBar(
        leading: Consumer<FolderDataProvider>(builder: (context, value, child) {
          return CustomBackButton(
              text: isNewNote ? "Folders" : currentFolder.folderName,
              navigationFunction: navigateBack);
        }),
        leadingWidth: double.infinity,
      ),
    );
  }
}
