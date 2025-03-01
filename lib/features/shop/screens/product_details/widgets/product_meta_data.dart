import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/common/widgets/images/circular_image.dart';
import 'package:brother_store/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:brother_store/common/widgets/texts/product_price_text.dart';
import 'package:brother_store/common/widgets/texts/product_title_text.dart';
import 'package:brother_store/features/shop/controllers/product/product_controller.dart';
import 'package:brother_store/features/shop/models/product_model.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:share_plus/share_plus.dart';

import 'bottom_add_to_cart_widget.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePrecentage =
        controller.calculateSalePresentage(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price and sale price
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (salePrecentage != null)
                  TRoundedContainer(
                    radius: BorderRadius.circular(TSizes.sm),
                    backgroundColor: TColors.secondary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      '$salePrecentage%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),

                if (salePrecentage != null)
                  const SizedBox(
                    width: TSizes.spaceBtWItems,
                  ),

                ///price
                if (product.price > 0)
                  TProductPriceText(
                      price: '${product.price}',
                      isLarg: false,
                      linethrough: true,
                      color: TColors.red),
                // Text(
                //   'SAR ${product.price}',
                //   style: Theme.of(context).textTheme.titleSmall!.apply(
                //       decoration: TextDecoration.lineThrough, color: Colors.red),
                // ),
                const SizedBox(width: TSizes.spaceBtWItems),
                if (product.salePrice > 0)
                  TProductPriceText(
                      price: '${product.salePrice}', isLarg: true),
              ],
            ),
            IconButton(
                onPressed: () async {
                  const urlPreview =
                      "https://www.youtube.com/watch?v=CNUBhb_cM6E";
                  final url = Uri.parse(product.thumbnail);
                  final response = await http.get(url);
                  final contentType = response.headers['content-type'];
                  final image = XFile.fromData(
                    response.bodyBytes,
                    mimeType: contentType,
                    name: 'Look what I like!',
                  );
                  await Share.shareXFiles([image],
                      text:
                          'Look what I like!  ${product.title} cost ${product.price} you can se the full image here ${product.thumbnail}');
                  // Share.share('check out my product \n\n $urlPreview',
                  //     subject:
                  //         'Look what I like! ${product.title} cost ${product.price}');

// }
//                       Share.share('check out my product ${product.thumbnail}',
//                           subject: 'Look what I like!')
                },
                icon: const Icon(Icons.share, size: TSizes.iconMd))
          ],
        ),

        const SizedBox(
          height: TSizes.spaceBtWItems / 1.5,
        ),

        ///title
        TProductTitleText(
          title: Get.locale?.languageCode == 'en'
              ? product.title
              : product.arabicTitle,
        ),
        const SizedBox(
          height: TSizes.spaceBtWItems / 1.5,
        ),

        Row(
          children: [
            const TProductTitleText(
              title: 'Status',
              smalSize: true,
            ),
            const SizedBox(
              width: TSizes.spaceBtWItems,
            ),
            Text(
              controller.getProductStockStatus(product.stock),
              // style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtWItems / 1.5,
        ),

        ///Brand

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TCircularImage(
                  image: product.brand!.image != ''
                      ? product.brand!.image
                      : TImages.bBlack,
                  isNetworkImage: product.brand!.image != '' ? true : false,
                  width: 32,
                  height: 32,
                ),
                const SizedBox(
                  width: TSizes.spaceBtWItems / 1.5,
                ),
                TBrandTitleWithVerifiedIcon(
                    title: product.brand != null ? product.brand!.name : ''),
              ],
            ),
            TBottomAddToCart(
              product: product,
            ),
          ],
        ),
      ],
    );
  }
}
