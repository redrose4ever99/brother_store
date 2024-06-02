import 'package:brother_store/common/widgets/layout/grid_layout.dart';
import 'package:brother_store/common/widgets/shimmers/shimmer.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TListTilehummer extends StatelessWidget {
  const TListTilehummer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            TShimmerEffect(
              width: 50,
              height: 50,
              raduis: 50,
            ),
            SizedBox(
              width: TSizes.spaceBtWItems,
            ),
            Column(
              children: [
                TShimmerEffect(width: 100, height: 15),
                SizedBox(
                  width: TSizes.spaceBtWItems / 2,
                ),
                TShimmerEffect(width: 80, height: 12),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
