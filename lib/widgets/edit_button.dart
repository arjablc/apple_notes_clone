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
          onPressed: () => null,
          child: const Icon(Ionicons.create_outline),
        ));
  }
}
