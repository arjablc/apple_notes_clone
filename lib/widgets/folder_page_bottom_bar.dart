import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class FoldersPageBottomBar extends StatelessWidget {
  const FoldersPageBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      color: CupertinoColors.systemGroupedBackground,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          PopupMenuButton(
            tooltip: null,
            color: CupertinoColors.lightBackgroundGray,
            elevation: 10,
            shadowColor: Colors.grey,
            position: PopupMenuPosition.under,
            offset: const Offset(0, -120),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(CupertinoIcons.folder_badge_plus),
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("Create Smart Folder"),
              ),
              const PopupMenuItem(child: Text("Create Folder"))
            ],
          ),
          Material(
              color: Colors.transparent,
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () => null,
                child: const Icon(Ionicons.create_outline),
              ))
        ]),
      ),
    );
  }
}
