import 'package:brother_store/common/widgets/shimmers/shimmer.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TClientShummer extends StatelessWidget {
  const TClientShummer({super.key, this.itemCount = 4});
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
