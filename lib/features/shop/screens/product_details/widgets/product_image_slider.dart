import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/circuler_container.dart';
import 'package:brother_store/common/widgets/icons/circuler_icon.dart';
import 'package:brother_store/common/widgets/product.cart/favorite_icon.dart';
import 'package:brother_store/features/general/screens/gallery_widget.dart';
import 'package:brother_store/features/shop/controllers/product/images_controller.dart';
import 'package:brother_store/features/shop/models/product_model.dart';
import 'package:brother_store/features/shop/screens/cart/cart.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagesController());

    // void openGallery() => Navigator.of(context).push(MaterialPageRoute(
    //     builder: (_) => GalleryWidget(index: ,
    //           urlImage: product.images!,
    //         )));

    final images = controller.getAllProductImage(product);
    //final dark = THelperFunctions.isDarkMode(context);

    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          // const SizedBox(
          //   height: TSizes.defaultSpace,
          // ),
          Stack(
            children: [
              Column(
                children: [
                  CarouselSlider(
                    carouselController: controller.carouselController,
                    options: CarouselOptions(
                        height: THelperFunctions.screenwidth() * 0.9,
                        autoPlayCurve: Curves.bounceInOut,
                        viewportFraction: 1,
                        onPageChanged: (index, _) => controller
                            .selectedProductImage.value = images[index]),
                    items: images
                        .map((image) => Hero(
                              transitionOnUserGestures: true,
                              tag: 'pro1',
                              child: Material(
                                child: InkWell(
                                  onTap: () => Get.to(() => GalleryWidget(
                                        index: images.indexOf(image),
                                        urlImage: images,
                                      )),

                                  //   ImagesController.instance.fullScreenImage(
                                  //       product.images!.indexOf(image),
                                  //       image,
                                  //       product.images!);
                                  // },,

                                  child: Ink.image(
                                    width: THelperFunctions.screenwidth(),
                                    height: 300,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      image,
                                    ),
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  // Row(
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: [
                  //     for (int i = 0; i < images.length; i++)
                  //       TCirculerContainer(
                  //         width: 20,
                  //         height: 5,
                  //         margin: const EdgeInsets.only(right: 5, left: 5),
                  //         backgroundColor:
                  //               controller.selectedProductImage.value != images[index]
                  //                 ? TColors.black
                  //                 : TColors.grey,
                  //       )
                  //   ],
                  // ),
                ],
              ),
              Positioned(
                bottom: 10,
                left: 4,
                right: 4,
                child: SizedBox(
                  height: 5,
                  child: Center(
                    child: ListView.separated(
                      itemCount: images.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (_, index) => Obx(
                        () {
                          //
                          final imageSelected =
                              controller.selectedProductImage.value ==
                                  images[index];
                          if (kDebugMode) {
                            print(images[index]);
                          }
                          return TCirculerContainer(
                            width: imageSelected ? 20 : 8,
                            height: 8,
                            // margin: const EdgeInsets.only(right: 2, left: 2),
                            backgroundColor:
                                imageSelected ? TColors.primary : TColors.grey,
                          );
                        },
                      ),
                      separatorBuilder: (_, __) => const SizedBox(
                        width: TSizes.spaceBtWItems,
                      ),
                    ),
                  ),
                ),
              ),

              ///image slider for the small images

              TAppBar(
                showBackArrow: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        TFavoriteIcon(
                          productId: product.id,
                        ),
                        const SizedBox(
                          width: TSizes.spaceBtWItems,
                        ),
                        TCircularIcon(
                          onPressed: () => Get.to(() => const CartScreen()),
                          icon: Iconsax.shopping_bag,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          // SizedBox(
          //   height: 55,
          //   child: ListView.separated(
          //     itemCount: images.length,
          //     shrinkWrap: true,
          //     scrollDirection: Axis.horizontal,
          //     physics: const AlwaysScrollableScrollPhysics(),
          //     itemBuilder: (_, index) => Obx(
          //       () {
          //         //
          //         final imageSelected =
          //             controller.selectedProductImage.value != images[index];
          //         if (kDebugMode) {
          //           print(images[index]);
          //         }
          //         return TRoundedImage(
          //           onPressed: () {
          //             controller.selectedProductImage.value = images[index];
          //             controller.carouselController.jumpToPage(index);
          //           },
          //           imageUrl: images[index],
          //           backgroundColor: dark ? TColors.dark : TColors.light,
          //           border: Border.all(
          //               color: imageSelected
          //                   ? Colors.transparent
          //                   : TColors.primary),
          //           width: 55,
          //           isNetworkImage: true,
          //           padding: const EdgeInsets.all(TSizes.sm),
          //         );
          //       },
          //     ),
          //     separatorBuilder: (_, __) => const SizedBox(
          //       width: TSizes.spaceBtWItems,
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: TSizes.defaultSpace,
          ),
        ],
      ),
    );
  }
}
