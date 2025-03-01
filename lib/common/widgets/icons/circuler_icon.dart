// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    Key? key,
    this.width,
    this.height,
    this.size = TSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  }) : super(key: key);
  final double? width, height, size;
  final IconData icon;
  final Color? backgroundColor, color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: backgroundColor != null
                  ? backgroundColor!
                  : THelperFunctions.isDarkMode(context)
                      ? TColors.black.withOpacity(0.9)
                      : TColors.light.withOpacity(0.9),
              borderRadius: BorderRadius.circular(100)),
          child: Center(
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                icon,
                color: color,
                size: size,
              ),
            ),
          )),
    );
  }
}
