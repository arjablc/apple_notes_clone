import 'package:apple_notes_clone/models/notes_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:apple_notes_clone/pages/edit_and_view_page.dart';
import 'package:provider/provider.dart';

class NotesListTiles extends StatelessWidget {
  const NotesListTiles({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.noteId,
    required this.folderId,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String noteId;
  final String folderId;

  @override
  Widget build(BuildContext context) {
    final String date = Provider.of<NotesDataProvider>(context)
        .notesList
        .firstWhere((element) => element.id == noteId)
        .timeOfCreation;
    return CupertinoListTile(
      onTap: () => Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => EditViewPage(
                isQuickNote: (folderId == 'quicknote') ? true : false,
                isNewNote: false,
                folderId: folderId,
                noteId: noteId,
              ))),
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
      ),
      subtitle: Text(
        "$date\t$subtitle",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 15),
      ),
    );
  }
}
