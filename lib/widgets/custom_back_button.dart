import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
    required this.text,
    required this.navigationFunction,
  }) : super(key: key);
  final String text;

  final Function navigationFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GestureDetector(
        //Push and remove until used to empty the navigation stack upto the folder part
        onTap: () => navigationFunction(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              CupertinoIcons.left_chevron,
              color: CupertinoColors.systemYellow,
            ),
            Text(
              text,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: CupertinoColors.systemYellow, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
