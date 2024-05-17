import 'package:brother_store/common/widgets/shimmers/shimmer.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryShummer extends StatelessWidget {
  const TCategoryShummer({super.key, this.itemCount = 6});
  final itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, __) {
            return const Column(
              children: [
                TShimmerEffect(width: 80, height: 75, raduis: 80),
                SizedBox(
                  height: TSizes.spaceBtWItems / 2,
                ),
                TShimmerEffect(width: 90, height: 14),
              ],
            );
          },
          separatorBuilder: (_, __) => const SizedBox(
                width: TSizes.spaceBtWItems,
              ),
          itemCount: itemCount),
    );
  }
}
