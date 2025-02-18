import 'package:brother_store/common/widgets/layout/grid_layout.dart';
import 'package:brother_store/common/widgets/shimmers/shimmer.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';

import 'package:flutter/material.dart';

class TGalleryPhotoShimmer extends StatelessWidget {
  const TGalleryPhotoShimmer({super.key, this.itemCount = 4});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
        maxAxisExtent: 240,
        itemCount: itemCount,
        crossColumn: 1,
        itemBuilder: (_, __) => SizedBox(
              //width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TShimmerEffect(
                    width: THelperFunctions.screenwidth() -
                        TSizes.defaultSpace * 2,
                    height: THelperFunctions.screenwidth() / 1.7,
                  ),
                ],
              ),
            ));
  }
}
