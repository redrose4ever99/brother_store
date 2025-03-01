// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/common/styles/shadows.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/common/widgets/products/product_cards/add_to_cart_button.dart';
import 'package:brother_store/common/widgets/texts/product_price_text.dart';
import 'package:brother_store/common/widgets/texts/product_title_text.dart';
import 'package:brother_store/features/shop/controllers/product/product_controller.dart';
import 'package:brother_store/features/shop/models/product_model.dart';
import 'package:brother_store/features/shop/screens/product_details/product_detail.dart';
import 'package:brother_store/features/shop/screens/product_details/widgets/product_image_slider_mini.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final isEg = Get.locale?.languageCode == 'en';
    final controller = ProductController.instance;

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(product: product)),
      child: Hero(
        tag: 'pro1',
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
              boxShadow: [TShadowStyle.verticalProductShadow],
              color: dark ? TColors.dark.withOpacity(0.5) : TColors.white,
              borderRadius: BorderRadius.circular(TSizes.productImageRadius)),
          child: SizedBox(
            height: 210,
            child: Column(
              children: [
                TRoundedContainer(
                  radius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                  height: 190,
                  // padding: const EdgeInsets.all(TSizes.sm),
                  //backgroundColor: dark ? TColors.dark : TColors.light,
                  child: TProductImageSliderMini(product: product),
                ),
                //   productPhoto(
                //       product: product, s: s, salePrecentage: salePrecentage),
                // ),

                //details section
                const SizedBox(height: TSizes.sm),

                Padding(
                  padding:
                      const EdgeInsets.only(left: TSizes.sm, right: TSizes.sm),
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
                      // const SizedBox(height: TSizes.spaceBtWItems / 2),
                      //TBrandTitleWithVerifiedIcon(title: product.brand!.name),

                      //price row
                    ],
                  ),
                ),
                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Padding(
                            padding: isEg
                                ? const EdgeInsets.only(left: TSizes.sm)
                                : const EdgeInsets.only(right: TSizes.sm),
                            child: TProductPriceText(
                              price: controller.getProductPrice(product),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ProductAddToCartButton(product: product)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
