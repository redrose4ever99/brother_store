import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:brother_store/common/widgets/icons/circuler_icon.dart';
import 'package:brother_store/common/widgets/images/rounded_image.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkerGray : TColors.light,
        child: Stack(
          children: [
            ///main larg image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                    child: Image(image: AssetImage(TImages.productImg1))),
              ),
            )

            ///image slider for the small images
            ,
            Positioned(
                bottom: 30,
                right: 0,
                left: TSizes.defaultSpace,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    itemCount: 6,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => TRoundedImage(
                      imageUrl: TImages.productImg1,
                      backgroundColor: dark ? TColors.dark : TColors.light,
                      border: Border.all(color: TColors.primary),
                      width: 80,
                      padding: const EdgeInsets.all(TSizes.sm),
                    ),
                    separatorBuilder: (_, __) => const SizedBox(
                      width: TSizes.spaceBtWItems,
                    ),
                  ),
                )),
            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
