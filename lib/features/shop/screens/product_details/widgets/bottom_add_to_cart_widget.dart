// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';

import 'package:brother_store/common/widgets/icons/circuler_icon.dart';
import 'package:brother_store/features/shop/controllers/product/cart_controller.dart';
import 'package:brother_store/features/shop/models/product_model.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGray : TColors.light,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(TSizes.cardRadiusLg),
              topLeft: Radius.circular(TSizes.cardRadiusLg))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Obx(
          () => Row(
            children: [
              TCircularIcon(
                icon: Iconsax.minus,
                width: 40,
                height: 40,
                color: TColors.white,
                backgroundColor: TColors.darkerGray,
                onPressed: () => controller.productQuantityinCart.value < 1
                    ? null
                    : controller.productQuantityinCart -= 1,
              ),
              const SizedBox(
                width: TSizes.spaceBtWItems,
              ),
              Text(
                controller.productQuantityinCart.value.toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: TSizes.spaceBtWItems,
              ),
              TCircularIcon(
                icon: Iconsax.add,
                width: 40,
                height: 40,
                color: TColors.white,
                backgroundColor: TColors.black,
                onPressed: () => controller.productQuantityinCart += 1,
              ),
            ],
          ),
        ),
        ElevatedButton(
            onPressed: controller.productQuantityinCart.value < 1
                ? null
                : () => controller.addToCart(product),
            style: ElevatedButton.styleFrom(
                backgroundColor: TColors.black,
                side: const BorderSide(color: TColors.black),
                padding: const EdgeInsets.all(TSizes.md)),
            child: Text(
              AppLocalizations.of(context)!.addToCart,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .apply(color: TColors.white),
            ))
      ]),
    );
  }
}
