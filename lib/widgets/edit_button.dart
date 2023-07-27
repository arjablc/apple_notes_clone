import 'package:apple_notes_clone/pages/edit_and_view_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
  });

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
                  noteId: UniqueKey().toString(),
                  folderId: 'quicknotes',
                  isNewNote: true))),
          child: const Icon(Ionicons.create_outline),
        ));
  }
}
