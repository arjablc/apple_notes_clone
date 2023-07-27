import 'package:apple_notes_clone/widgets/edit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/notes_provider.dart';
import '../models/folders_provider.dart';
import '../widgets/folder_list_tile.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/ios_style_popup_menu.dart';

class FoldersPage extends StatefulWidget {
  const FoldersPage({super.key});
  static const String routeName = '/folder-page';

  @override
  State<FoldersPage> createState() => _FoldersPageState();
}

class _FoldersPageState extends State<FoldersPage> {
  bool isEditMode = false;
  bool hideIclouds = true;

  @override
  Widget build(BuildContext context) {
    final noteList = Provider.of<NotesDataProvider>(context).notesList;

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent)),
              onPressed: () => setState(() {
                    isEditMode = !isEditMode;
                  }),
              child: Text(isEditMode ? "Done" : "Edit"))
        ],
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Folders",
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: ListView(
              primary: false,
              physics: const BouncingScrollPhysics(),
              children: [
                //* Quick Notes section
                Consumer<FolderDataProvider>(builder: (context, value, child) {
                  final quickNote = value.quickNote;
                  return CupertinoListSection.insetGrouped(
                    children: [
                      FoldersListTile(
                        folderId: quickNote.id,
                        isEditMode: false,
                        folderName: quickNote.folderName,
                        notesNumber:
                            value.updateFolderNotecount(noteList, quickNote.id),
                      )
                    ],
                  );
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "iCloud",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      //* dropdown toggler
                      TextButton(
                          onPressed: () => setState(() {
                                hideIclouds = !hideIclouds;
                              }),
                          child: hideIclouds
                              ? const Icon(CupertinoIcons.chevron_up)
                              : const Icon(CupertinoIcons.chevron_down))
                    ],
                  ),
                ),
                //* I Cloud folder list
                Consumer<FolderDataProvider>(builder: (context, value, child) {
                  final foldersList = value.folderList;
                  return CupertinoListSection.insetGrouped(
                    children: List.generate(
                        foldersList.length,
                        (index) => FoldersListTile(
                            isEditMode: isEditMode,
                            folderId: foldersList[index].id,
                            folderName: foldersList[index].folderName,
                            notesNumber: value.updateFolderNotecount(
                                noteList, foldersList[index].id))),
                  );
                }),
              ],
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BottomBar(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IosStylePopupMenu(),
                      EditButton(
                        initiateQuickNote: true,
                        callingFolderId: 'quicknotes',
                      )
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
