import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_scribble_icon.dart';

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
        leading: (folderName == "Quick Notes")
            ? const CustomIconScribbleInBox()
            : const Icon(CupertinoIcons.folder),
        title: Text(
          folderName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        trailing: Row(
          children: [
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
