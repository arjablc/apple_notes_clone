import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_scribble_icon.dart';

class FoldersListTile extends StatelessWidget {
  const FoldersListTile({
    Key? key,
    required this.folderName,
    required this.notesNumber,
    required this.isEditMode,
  }) : super(key: key);
  final String folderName;
  final int notesNumber;
  final bool isEditMode;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
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
                    //TODO Implement the dragging behavior
                    onVerticalDragUpdate: ((details) => null),
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
