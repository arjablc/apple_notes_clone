import 'package:apple_notes_clone/models/folders_provider.dart';
import 'package:apple_notes_clone/models/notes_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class FoldersPage extends StatefulWidget {
  const FoldersPage({super.key});
  static const String routeName = '/';

  @override
  State<FoldersPage> createState() => _FoldersPageState();
}

class _FoldersPageState extends State<FoldersPage> {
  final bool isEditMode = false;

  @override
  Widget build(BuildContext context) {
    final noteList = Provider.of<NotesDataProvider>(context).notesList;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: const Text("Edit"))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Folders",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
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
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "iCloud",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
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
            })
          ],
        ),
      ),
    );
  }
}

class FoldersListTile extends StatelessWidget {
  const FoldersListTile({
    Key? key,
    required this.folderName,
    required this.notesNumber,
  }) : super(key: key);
  final String folderName;
  final int notesNumber;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      leading: const CustomIconScribbleInBox(),
      title: Text(
        folderName,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      trailing: Text("${notesNumber.toString()} >"),
    );
  }
}

class CustomIconScribbleInBox extends StatelessWidget {
  const CustomIconScribbleInBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Center(
          child: Icon(
            CupertinoIcons.scribble,
            size: 15,
          ),
        ),
        Icon(
          Ionicons.calendar_clear_outline,
          size: 25,
        ),
      ],
    );
  }
}
