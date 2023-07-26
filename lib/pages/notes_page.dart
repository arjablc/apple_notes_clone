import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration:
                BoxDecoration(color: CupertinoColors.lightBackgroundGray),
            child: CupertinoTextField(),
          )
        ],
      ),
    );
  }
}
