import 'package:brother_store/common/widgets/icons/circuler_icon.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGray : TColors.light,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(TSizes.cardRadiusLg),
              topLeft: Radius.circular(TSizes.cardRadiusLg))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            const TCircularIcon(
              icon: Iconsax.minus,
              width: 40,
              height: 40,
              color: TColors.white,
              backgroundColor: TColors.darkerGray,
            ),
            const SizedBox(
              width: TSizes.spaceBtWItems,
            ),
            Text(
              '2',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              width: TSizes.spaceBtWItems,
            ),
            const TCircularIcon(
              icon: Iconsax.add,
              width: 40,
              height: 40,
              color: TColors.white,
              backgroundColor: TColors.black,
            ),
          ],
        ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: TColors.black,
                side: const BorderSide(color: TColors.black),
                padding: const EdgeInsets.all(TSizes.md)),
            child: const Text('Add To Cart'))
      ]),
    );
  }
}
