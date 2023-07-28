import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/edit_button.dart';
import '../models/folders_provider.dart';
import '../models/notes_provider.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/notes_list_tile.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({
    Key? key,
    required this.folderId,
  }) : super(key: key);
  static const routeName = "/notes-pate";
  final String folderId;

  void navigateBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        leading: CustomBackButton(
          text: "Folders",
          navigationFunction: navigateBack,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.ellipsis_vertical_circle,
                color: CupertinoColors.systemYellow,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Consumer<FolderDataProvider>(builder: (context, value, child) {
                  final currentFolder = folderId == "quicknotes"
                      ? value.quickNote
                      : value.getFolderById(folderId);
                  return Text(
                    currentFolder.folderName,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.displaySmall,
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                CupertinoSearchTextField(
                  borderRadius: BorderRadius.circular(10),
                ),
                Consumer<NotesDataProvider>(builder: (context, value, child) {
                  List<Notes> folderedNotes =
                      value.getNotesByFolderId(folderId);
                  return folderedNotes.isEmpty
                      ? const Center(
                          child: Text("No Notes"),
                        )
                      : CupertinoListSection.insetGrouped(
                          margin: const EdgeInsets.only(top: 15),
                          children: List.generate(
                              folderedNotes.length,
                              (index) => NotesListTiles(
                                  title: folderedNotes[index].generateNoteTitle,
                                  subtitle:
                                      folderedNotes[index].generateSubtitle,
                                  noteId: folderedNotes[index].id,
                                  folderId: folderId)),
                        );
                })
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BottomBar(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    EditButton(
                      initiateQuickNote: false,
                      callingFolderId: folderId,
                    )
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
