import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/features/shop/models/product_model.dart';
import 'package:brother_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widgets/bottom_add_to_cart_widget.dart';
import 'widgets/product_image_slider.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    //final dark = THelperFunctions.isDarkMode(context);
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: TBottomAddToCart(
          product: product,
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
                  const TRatingAndShare(),

                  ///price Title,Stack, & brand
                  TProductMetaData(
                    product: product,
                  ),

                  ///Attributes
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(AppLocalizations.of(context)!.checkout)),
                  ),
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
                    trimCollapsedText: AppLocalizations.of(context)!.showMore,
                    trimExpandedText: AppLocalizations.of(context)!.less,
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  ///Reviews

                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtWItems,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                        title: 'Reviews (199)',
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

                  const SizedBox(
                    height: TSizes.spaceBtWsections,
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
