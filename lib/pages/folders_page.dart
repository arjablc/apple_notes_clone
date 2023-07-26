import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class FoldersPage extends StatelessWidget {
  const FoldersPage({super.key});
  static const String routeName = '/folder-page';

  final bool isEditMode = false;

  @override
  Widget build(BuildContext context) {
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
            CupertinoListSection.insetGrouped(
              children: [
                CupertinoListTile(
                    leading: const CustomIconScribbleInBox(),
                    title: Text(
                      "Quick Notes",
                      style: Theme.of(context).textTheme.titleSmall,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "iCloud",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomIconScribbleInBox extends StatelessWidget {
  const CustomIconScribbleInBox({
    super.key,
  });

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
