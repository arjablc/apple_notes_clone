import 'package:apple_notes_clone/models/folders_provider.dart';
import 'package:apple_notes_clone/models/notes_provider.dart';
import 'package:apple_notes_clone/widgets/custom_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import '../widgets/folder_list_tile.dart';

class FoldersPage extends StatefulWidget {
  const FoldersPage({super.key});
  static const String routeName = '/';

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
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.black),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () => setState(() {
                    isEditMode = !isEditMode;
                  }),
              child: const Text("Edit"))
        ],
        title: Text(
          "Folders",
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.925) - 100,
            child: ListView(
              children: [
                //* Quick Notes section
                Consumer<FolderDataProvider>(builder: (context, value, child) {
                  final quickNote = value.quickNote;
                  return CupertinoListSection.insetGrouped(
                    children: [
                      FoldersListTile(
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
                      Text(
                        "iCloud",
                        style: Theme.of(context).textTheme.titleLarge,
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
                            folderName: foldersList[index].folderName,
                            notesNumber: value.updateFolderNotecount(
                                noteList, foldersList[index].id))),
                  );
                }),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.075,
            color: CupertinoColors.systemGroupedBackground,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PopupMenuButton(
                      tooltip: null,
                      color:
                          CupertinoColors.lightBackgroundGray.withOpacity(0.7),
                      elevation: 10,
                      shadowColor: Colors.grey,
                      position: PopupMenuPosition.over,
                      offset: const Offset(0, -120),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(CupertinoIcons.folder_badge_plus),
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          child: Text("Create Smart Folder"),
                        ),
                        const PopupMenuItem(child: Text("Create Folder"))
                      ],
                    ),
                    const CustomButton(
                        function: null, child: Icon(Ionicons.create_outline))
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
