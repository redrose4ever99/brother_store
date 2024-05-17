import 'package:flutter/material.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    Key? key,
    required this.price,
    this.currentSign = '\$',
    this.maxLines = 1,
    this.isLarg = false,
    this.linethrough = false,
  }) : super(key: key);

  final String currentSign, price;
  final int maxLines;
  final bool isLarg;
  final bool linethrough;
  @override
  Widget build(BuildContext context) {
    return Text(
      currentSign + price,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: isLarg
          ? Theme.of(context).textTheme.headlineSmall!.apply(
              decoration: linethrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: linethrough ? TextDecoration.lineThrough : null),
    );
  }
}
