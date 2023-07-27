import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NotesListTiles extends StatelessWidget {
  const NotesListTiles({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
      ),
      subtitle: Text(
        subtitle,
        maxLines: 1,
        overflow: TextOverflow.fade,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 15),
      ),
    );
  }
}
