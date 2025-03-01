import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/features/shop/controllers/product/cart_controller.dart';
import 'package:brother_store/features/shop/models/product_model.dart';
import 'package:brother_store/features/shop/screens/cart/cart.dart';
import 'package:brother_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:brother_store/utils/loader/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import 'widgets/product_image_slider.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    //final dark = THelperFunctions.isDarkMode(context);
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Container(
        color:
            THelperFunctions.isDarkMode(context) ? Colors.black : Colors.white,
        child: SafeArea(
          top: true,
          left: false,
          right: false,
          child: Scaffold(
            // bottomNavigationBar: TBottomAddToCart(
            //   product: product,
            // ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.defaultSpace * 4, vertical: 14),
              child: Obx(
                () => controller.totalOfCartPrice.value > 0
                    ? SizedBox(
                        width: THelperFunctions.screenwidth() / 2,
                        height: 60,
                        child: ElevatedButton(
                            onPressed: controller.totalOfCartPrice.value > 0
                                ? () => Get.to(() => const CartScreen())
                                : () => TLoader.warningSnackBar(
                                    title:
                                        AppLocalizations.of(context)!.cartEmpty,
                                    message: AppLocalizations.of(context)!
                                        .addItemTotheCartForOrderProcess),
                            child: Text(
                              AppLocalizations.of(context)!.viewCart,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .apply(color: TColors.white),
                            )),
                      )
                    : const SizedBox(),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ///1- product image slider
                  TProductImageSlider(
                    product: product,
                  ),

                  //-- product Details
                  Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: Column(children: [
                      ///Rating and share buttons
                      Visibility(
                          visible: false,
                          child: TRatingAndShare(product: product)),

                      ///price Title,Stack, & brand
                      TProductMetaData(
                        product: product,
                      ),

                      // TBottomAddToCart(
                      //   product: product,
                      // ),

                      const SizedBox(
                        height: TSizes.spaceBtWsections,
                      ),

                      ///Descriptions
                      TSectionHeading(
                        title: AppLocalizations.of(context)!.descriptions,
                        showActionButton: false,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtWItems,
                      ),
                      ReadMoreText(
                        Get.locale?.languageCode == 'en'
                            ? product.description ?? ''
                            : product.arabicDescription ?? '',
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText:
                            AppLocalizations.of(context)!.showMore,
                        trimExpandedText: AppLocalizations.of(context)!.less,
                        moreStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w800),
                        lessStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w800),
                      ),

                      ///Reviews

                      //  const Divider(),
                      // const SizedBox(
                      //   height: TSizes.spaceBtWItems,
                      // ),

                      Visibility(
                        visible: false,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TSectionHeading(
                              title: 'Reviews (190)',
                              showActionButton: false,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Get.locale?.languageCode == 'en'
                                      ? Icons.keyboard_arrow_right
                                      : Icons.keyboard_arrow_left,
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtWsections / 2,
                      ),
                      //
                      //
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
