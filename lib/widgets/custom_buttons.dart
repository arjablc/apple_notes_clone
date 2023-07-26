import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.child,
    required this.function,
  }) : super(key: key);
  final Widget child;
  final Function? function;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () => function,
          child: child,
        ));
  }
}
