// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/utils/constants/color.dart';
import 'package:flutter/material.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    Key? key,
    this.width,
    this.height,
    this.radius,
    this.child,
    this.showBorder = false,
    this.borderColor = TColors.borderPrimary,
    this.padding,
    this.margin,
    this.enableShadow = false,
    this.backgroundColor = TColors.white,
  }) : super(key: key);

  final double? width;
  final double? height;
  final BorderRadius? radius;
  final Widget? child;
  final bool enableShadow;
  final bool showBorder;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          boxShadow: enableShadow
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurStyle: BlurStyle.outer,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]
              : null,
          borderRadius: radius,
          border: showBorder ? Border.all(color: borderColor) : null,
          color: backgroundColor),
      child: child,
    );
  }
}
