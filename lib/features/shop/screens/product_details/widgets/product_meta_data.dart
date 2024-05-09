import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/common/widgets/images/circular_image.dart';
import 'package:brother_store/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:brother_store/common/widgets/texts/product_price_text.dart';
import 'package:brother_store/common/widgets/texts/product_title_text.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price and sale price
        Row(
          children: [
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary,
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),

            const SizedBox(
              width: TSizes.spaceBtWItems,
            ),

            ///price
            Text(
              '\$250',
              style: Theme.of(context).textTheme.titleSmall!.apply(
                  decoration: TextDecoration.lineThrough, color: Colors.red),
            ),
            const SizedBox(width: TSizes.spaceBtWItems),
            const TProductPriceText(price: '190', isLarg: true),
          ],
        ),

        const SizedBox(
          height: TSizes.spaceBtWItems / 1.5,
        ),

        ///title
        const TProductTitleText(title: 'Salon chair with wood legs'),
        const SizedBox(
          height: TSizes.spaceBtWItems / 1.5,
        ),

        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(
              width: TSizes.spaceBtWItems,
            ),
            Text(
              'In Stack',
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtWItems / 1.5,
        ),

        ///Brand

        const Row(
          children: [
            TCircularImage(
              image: TImages.brandImage1,
              width: 32,
              height: 32,
            ),
            TBrandTitleWithVerifiedIcon(title: 'Amazone'),
          ],
        ),
      ],
    );
  }
}
