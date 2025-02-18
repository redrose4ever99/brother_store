import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TGridGalleryLayout extends StatelessWidget {
  const TGridGalleryLayout({
    Key? key,
    required this.itemCount,
    this.maxAxisExtent = 150,
    required this.itemBuilder,
  }) : super(key: key);
  final int itemCount;
  final double? maxAxisExtent;
  final Widget Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: TSizes.gridViewSpacing,
            crossAxisSpacing: TSizes.gridViewSpacing,
            mainAxisExtent: maxAxisExtent),
        itemBuilder: itemBuilder);
  }
}
