import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:brother_store/common/widgets/images/rounded_image.dart';
import 'package:brother_store/common/widgets/product.cart/favorite_icon.dart';
import 'package:brother_store/features/shop/controllers/product/images_controller.dart';
import 'package:brother_store/features/shop/models/product_model.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagesController());

    final images = controller.getAllProductImage(product);
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkerGray : TColors.light,
        child: Stack(
          children: [
            ///main larg image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnLargedImage(image, '', ''),
                    child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, DownloadProgress) =>
                            CircularProgressIndicator(
                              value: DownloadProgress.progress,
                              color: TColors.primary,
                            )),
                  );
                })),
              ),
            )

            ///image slider for the small images
            ,
            Positioned(
                bottom: 30,
                right: 0,
                left: TSizes.defaultSpace,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    itemCount: images.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => Obx(
                      () {
                        final imageSelected =
                            controller.selectedProductImage.value !=
                                images[index];
                        if (kDebugMode) {
                          print(images[index]);
                        }
                        return TRoundedImage(
                          onPressed: () => controller
                              .selectedProductImage.value = images[index],
                          imageUrl: images[index],
                          backgroundColor: dark ? TColors.dark : TColors.light,
                          border: Border.all(
                              color: imageSelected
                                  ? Colors.transparent
                                  : TColors.primary),
                          width: 80,
                          isNetworkImage: true,
                          padding: const EdgeInsets.all(TSizes.sm),
                        );
                      },
                    ),
                    separatorBuilder: (_, __) => const SizedBox(
                      width: TSizes.spaceBtWItems,
                    ),
                  ),
                )),
            TAppBar(
              showBackArrow: true,
              actions: [
                TFavoriteIcon(
                  productId: product.id,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
