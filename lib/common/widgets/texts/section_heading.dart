// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    Key? key,
    this.textColor,
    required this.title,
    this.showActionButton = false,
    this.buttonTitle = 'View all',
    this.onPress,
  }) : super(key: key);
  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(
              onPressed: onPress,
              child: Text(
                buttonTitle,
                style: Theme.of(context).textTheme.bodySmall,
              ))
      ],
    );
  }
}
