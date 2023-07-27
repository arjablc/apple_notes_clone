import 'package:apple_notes_clone/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

class EditViewPage extends StatelessWidget {
  const EditViewPage({super.key});

  void navigateBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            CustomBackButton(text: "Notes", navigationFunction: navigateBack),
        leadingWidth: 100,
      ),
    );
  }
}
