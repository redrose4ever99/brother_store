import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import 'widgets/bottom_add_to_cart_widget.dart';
import 'widgets/product_image_slider.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
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
                      onPressed: () {}, child: const Text('checkout')),
                ),
                const SizedBox(
                  height: TSizes.spaceBtWsections,
                ),

                ///Descriptions
                const TSectionHeading(
                  title: 'Descriptions',
                  showActionButton: false,
                ),
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
                const ReadMoreText(
                  'Ullamco sit non nisi exercitation quis incididunt minim duis sint do ipsum. Voluptate eiusmod labore duis Laborum cupidatat dolore eiusmod deserunt anim aute ex.ullamco ex consequat proident deserunt consectetur nisi quis amet.Do in ipsum ea laborum esse nulla sunt ullamco.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'show more',
                  trimExpandedText: 'less',
                  moreStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
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
                        icon: const Icon(Iconsax.arrow_right_3))
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
