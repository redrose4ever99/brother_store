import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    Key? key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRaduis = true,
    this.border,
    this.backgroundColor = TColors.light,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRaduis = TSizes.md,
  }) : super(key: key);
  final double? width, height;
  final String imageUrl;
  final bool applyImageRaduis;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRaduis;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
              border: border,
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRaduis)),
          child: ClipRRect(
            borderRadius: applyImageRaduis
                ? BorderRadius.circular(borderRaduis)
                : BorderRadius.zero,
            child: Image(
              fit: fit,
              image: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider,
            ),
          )),
    );
  }
}
