// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    Key? key,
    this.width = 56,
    this.height = 56,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.padding = TSizes.sm,
    this.overLayColor,
    this.backgroundColor,
  }) : super(key: key);

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final double width, height, padding;
  final Color? overLayColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            color: backgroundColor ??
                (THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white),
            borderRadius: BorderRadius.circular(100)),
        child: Center(
          child: Image(
            color: overLayColor,
            fit: fit,
            image: isNetworkImage
                ? NetworkImage(image)
                : AssetImage(image) as ImageProvider,
          ),
        ));
  }
}
