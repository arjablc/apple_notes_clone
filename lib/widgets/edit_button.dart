import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:apple_notes_clone/pages/edit_and_view_page.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    Key? key,
    required this.initiateQuickNote,
    required this.callingFolderId,
  }) : super(key: key);
  final bool initiateQuickNote;
  final String callingFolderId;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () => Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => EditViewPage(
                  isQuickNote: initiateQuickNote,
                  noteId: UniqueKey().toString(),
                  folderId: callingFolderId,
                  isNewNote: true))),
          child: const Icon(Ionicons.create_outline),
        ));
  }
}
