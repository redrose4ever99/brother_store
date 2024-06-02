import 'package:brother_store/utils/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    Key? key,
    required this.price,
    this.color = TColors.primary,
    this.currentSign = ' SAR',
    this.maxLines = 1,
    this.isLarg = false,
    this.linethrough = false,
  }) : super(key: key);

  final String currentSign, price;
  final int maxLines;
  final bool isLarg;
  final Color color;
  final bool linethrough;
  @override
  Widget build(BuildContext context) {
    return Text(
      Get.locale?.languageCode == 'en' ? price + currentSign : '$price رس',
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: isLarg
          ? Theme.of(context).textTheme.headlineSmall!.apply(
              color: color,
              decoration: linethrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              color: color,
              decoration: linethrough ? TextDecoration.lineThrough : null),
    );
  }
}
