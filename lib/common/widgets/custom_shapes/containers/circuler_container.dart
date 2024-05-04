import 'package:brother_store/utils/constants/color.dart';
import 'package:flutter/material.dart';

class TCirculerContainer extends StatelessWidget {
  const TCirculerContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.margin,
    this.child,
    this.backgroundColor = TColors.light,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(400), color: backgroundColor),
    );
  }
}
