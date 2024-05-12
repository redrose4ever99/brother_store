import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widgets/bottom_add_to_cart_widget.dart';
import 'widgets/product_image_slider.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///1- product image slider
            const TProductImageSlider(),

            //-- product Details
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(children: [
                ///Rating and share buttons
                const TRatingAndShare(),

                ///price Title,Stack, & brand
                const TProductMetaData(),

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
                  'Ullamco sit non nisi exercitation quis incididunt minim duis sint do ipsum. Voluptate eiusmod labore duis Laborum cupidatat dolore eiusmod deserunt anim aute ex.ullamco ex consequat proident deserunt consectetur nisi quis amet.Do in ipsum ea laborum esse nulla sunt ullamco.',
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
    );
  }
}
