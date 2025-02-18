// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';

import 'package:brother_store/common/widgets/icons/circuler_icon.dart';
import 'package:brother_store/features/shop/controllers/product/cart_controller.dart';
import 'package:brother_store/features/shop/models/product_model.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
//import 'package:brother_store/utils/helpers/helper_functions.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    //final dark = THelperFunctions.isDarkMode(context);
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);

    return Obx(
      () => TRoundedContainer(
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.black.withOpacity(0.9)
            : TColors.light.withOpacity(0.9),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              TCircularIcon(
                  icon: Iconsax.minus,
                  width: 40,
                  height: 40,
                  color: THelperFunctions.isDarkMode(context)
                      ? TColors.white
                      : TColors.black,
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    if (controller.productQuantityinCart.value >= 1) {
                      controller.productQuantityinCart -= 1;

                      controller.addToCart(product);
                    }
                  }),
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
                color: THelperFunctions.isDarkMode(context)
                    ? TColors.white
                    : TColors.black,
                backgroundColor: Colors.transparent,
                onPressed: () {
                  controller.productQuantityinCart.value += 1;
                  controller.addToCart(product);
                },
              ),
            ],
          ),
          // Visibility(
          //   visible: false,
          //   child: ElevatedButton(
          //       onPressed: controller.productQuantityinCart.value < 1
          //           ? null
          //           : () => controller.addToCart(product),
          //       style: ElevatedButton.styleFrom(
          //           backgroundColor: TColors.black,
          //           side: const BorderSide(color: TColors.black),
          //           padding: const EdgeInsets.all(TSizes.md)),
          //       child: Text(
          //         AppLocalizations.of(context)!.addToCart,
          //         style: Theme.of(context)
          //             .textTheme
          //             .titleMedium!
          //             .apply(color: TColors.white),
          //       )),
          // )
        ]),
      ),
    );
  }
}
