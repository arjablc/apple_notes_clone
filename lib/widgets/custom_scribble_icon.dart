import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconScribbleInBox extends StatelessWidget {
  const CustomIconScribbleInBox({
    Key? key,
  }) : super(key: key);

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
          Icons.calendar_today_rounded,
          size: 25,
        ),
      ],
    );
  }
}
