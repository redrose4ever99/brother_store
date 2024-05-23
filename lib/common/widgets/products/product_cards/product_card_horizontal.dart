// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:brother_store/common/widgets/texts/product_price_text.dart';
import 'package:brother_store/features/shop/models/product_model.dart';
import 'package:brother_store/features/shop/screens/product_details/product_detail.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:brother_store/common/styles/shadows.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/common/widgets/icons/circuler_icon.dart';
import 'package:brother_store/common/widgets/images/rounded_image.dart';
import 'package:brother_store/common/widgets/texts/product_title_text.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final isEg = Get.locale?.languageCode == 'en';
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(
            product: product,
          )),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            color: dark ? TColors.darkGrey : TColors.softGrey,
            borderRadius: BorderRadius.circular(TSizes.productImageRadius)),
        child: Row(
          children: [
            TRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  TRoundedImage(
                    imageUrl: product.thumbnail == ''
                        ? TImages.bBlack
                        : product.thumbnail,
                    applyImageRaduis: true,
                    isNetworkImage: product.thumbnail == '' ? false : true,
                  ),

                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
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
                  ),

                  //favorite icon button
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: TCircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      )),
                ],
              ),
            ),

            //details section
            const SizedBox(height: TSizes.spaceBtWItems / 2),
            //  padding: const EdgeInsets.only(left: TSizes.sm, right: TSizes.sm),
            SizedBox(
              width: 172,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: TSizes.sm),
                    child: Column(
                      children: [
                        TProductTitleText(
                          title: Get.locale?.languageCode == 'en'
                              ? product.title
                              : product.arabicTitle,
                          txtAlign: Get.locale?.languageCode == 'en'
                              ? TextAlign.left
                              : TextAlign.right,
                          smalSize: true,
                        ),
                        const SizedBox(height: TSizes.spaceBtWItems / 2),
                        const TBrandTitleWithVerifiedIcon(title: 'Amazon'),

                        //price row
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TProductPriceText(price: '250.0'),
                        Container(
                          decoration: BoxDecoration(
                              color: TColors.dark,
                              borderRadius: isEg
                                  ? const BorderRadius.only(
                                      topLeft: Radius.circular(
                                          TSizes.productImageRadius),
                                      bottomRight: Radius.circular(
                                          TSizes.productImageRadius),
                                    )
                                  : const BorderRadius.only(
                                      topRight: Radius.circular(
                                          TSizes.productImageRadius),
                                      bottomLeft: Radius.circular(
                                          TSizes.productImageRadius))),
                          child: const SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: Center(
                              child: Icon(
                                Iconsax.add,
                                color: TColors.white,
                              ),
                            ),
                          ),
                        )
                      ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
