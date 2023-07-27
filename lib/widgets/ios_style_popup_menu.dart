import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IosStylePopupMenu extends StatelessWidget {
  const IosStylePopupMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      tooltip: null,
      color: Theme.of(context).colorScheme.onSecondaryContainer,
      elevation: 10,
      position: PopupMenuPosition.over,
      offset: const Offset(0, -100),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Theme.of(context).shadowColor,
      itemBuilder: (context) => [
        PopupMenuItem(
            height: 40,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Create Smart Folder"),
                  Icon(
                    CupertinoIcons.gear,
                    color: Theme.of(context).textTheme.displayLarge!.color,
                    size: 20,
                  )
                ])),
        const PopupMenuItem(
            height: 0,
            padding: EdgeInsets.all(0),
            child: Divider(
              height: 2,
              thickness: 3,
            )),
        PopupMenuItem(
            height: 40,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Create Folder"),
                  Icon(
                    CupertinoIcons.folder,
                    color: Theme.of(context).textTheme.displayLarge!.color,
                    size: 20,
                  )
                ]))
      ],
      child: const Icon(CupertinoIcons.folder_badge_plus),
    );
  }
}
