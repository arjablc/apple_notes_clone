import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:apple_notes_clone/pages/notes_page.dart';

import 'custom_scribble_icon.dart';

class FoldersListTile extends StatelessWidget {
  const FoldersListTile({
    Key? key,
    required this.folderName,
    required this.notesNumber,
    required this.isEditMode,
    required this.folderId,
  }) : super(key: key);
  final String folderName;
  final int notesNumber;
  final bool isEditMode;
  final String folderId;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
        onTap: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => NotesPage(folderId: folderId),
              ),
            ),
        leading: (folderName == "Quick Notes")
            ? const CustomIconScribbleInBox()
            : const Icon(CupertinoIcons.folder),
        title: Text(
          folderName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        trailing: Row(
          children: isEditMode
              ? [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.ellipsis_circle,
                        size: 20,
                      )),
                  GestureDetector(
                    //TODO Implement the drag to rearrange behavior
                    // onVerticalDragUpdate: ((details) => null),
                    child: const Icon(
                      CupertinoIcons.line_horizontal_3,
                      color: CupertinoColors.lightBackgroundGray,
                    ),
                  )
                ]
              : [
                  Text(
                    notesNumber.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const Icon(
                    CupertinoIcons.right_chevron,
                    color: CupertinoColors.inactiveGray,
                  )
                ],
        ));
  }
}
