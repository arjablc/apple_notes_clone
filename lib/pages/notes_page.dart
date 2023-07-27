import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:apple_notes_clone/models/folders_provider.dart';
import 'package:apple_notes_clone/models/notes_provider.dart';
import 'package:apple_notes_clone/pages/folders_page.dart';

import '../widgets/custom_back_button.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({
    Key? key,
    required this.folderId,
  }) : super(key: key);
  static const routeName = "/notes-pate";
  final String folderId;

  void navigateBack(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => const FoldersPage()),
        ModalRoute.withName(FoldersPage.routeName));
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: ListView(
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
              List<Notes> folderedNotesList = value.getFolderedNoets(folderId);
              return (folderId != "all-icloud" && folderedNotesList.isEmpty)
                  ? const Center(
                      child: Text("No Notes"),
                    )
                  : CupertinoListSection.insetGrouped(
                      margin: const EdgeInsets.only(top: 15, bottom: 10),
                      children: folderId == "all-icloud"
                          ? List.generate(
                              value.notesList.length,
                              (index) => NotesListTiles(
                                  title:
                                      value.notesList[index].generateNoteTitle,
                                  subtitle: value.notesList[index].content))
                          : List.generate(
                              folderedNotesList.length,
                              (index) => NotesListTiles(
                                title:
                                    folderedNotesList[index].generateNoteTitle,
                                subtitle: folderedNotesList[index].content,
                              ),
                            ),
                    );
            })
          ],
        ),
      ),
    );
  }
}

class NotesListTiles extends StatelessWidget {
  const NotesListTiles({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
      ),
      subtitle: Text(
        subtitle,
        maxLines: 1,
        overflow: TextOverflow.fade,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 15),
      ),
    );
  }
}
