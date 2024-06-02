// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:brother_store/common/widgets/image_text_widets/vertical_image_text.dart';
import 'package:brother_store/common/widgets/layout/grid_layout.dart';
import 'package:brother_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:brother_store/features/gallery/screen/gallery.dart';
import 'package:brother_store/features/shop/controllers/product/productController.dart';
import 'package:brother_store/features/shop/screens/all_products/all_products.dart';
import 'package:brother_store/features/shop/screens/home/widgets/gallery_slider%20.dart';
import 'package:brother_store/features/shop/screens/store/brand/brand_card.dart';
import 'package:brother_store/features/shop/screens/store/clients/all_clients.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:brother_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import 'widgets/home_clients.dart';
import 'widgets/promo_slider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    //Get.updateLocale(const Locale('en'));
    return Scaffold(
      // floatingActionButton: const TCircularFabWidget(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          TPrimaryHeaderContainer(
              child: Column(
            children: [
              const THomeAppbar(),
              const SizedBox(
                height: TSizes.spaceBtWsections,
              ),
              //   Text(Get.locale!.languageCode),
              const TPromoSlider(
                banners: [
                  TImages.onBoarding1,
                  TImages.onBoarding2,
                  TImages.onBoarding3
                ],
              ),
              // TSearchContainer(
              //   text: 'Whats in your mind',
              //   icon: Iconsax.information,
              //   onTap: () {},
              // ),
              const SizedBox(
                height: TSizes.spaceBtWsections,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: TSizes.defaultSpace, right: TSizes.defaultSpace),
                child: TSectionHeading(
                  textColor: TColors.white,
                  //popularCategory
                  title: AppLocalizations.of(context)!.popularCategory,
                  showActionButton: false,
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtWItems,
              ),
              const THomeCategories(),
              const SizedBox(
                height: TSizes.spaceBtWsections,
              )
            ],
          ))
          //body from here
          ,
          Padding(
            padding: const EdgeInsets.only(
                left: TSizes.defaultSpace, right: TSizes.defaultSpace),
            child: TSectionHeading(
              title: AppLocalizations.of(context)!.gallery,
              buttonTitle: AppLocalizations.of(context)!.viewAll,
              showActionButton: true,
              onPress: () => Get.to(() => const TGalleryScreen()),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtWItems,
          ),
          const TGallerySlider(
            autoPlay: false,
            banners: [TImages.bannerOne, TImages.bannerTow, TImages.bannerFour],
          ),
          const SizedBox(
            height: TSizes.spaceBtWsections,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: TSizes.defaultSpace, right: TSizes.defaultSpace),
            child: Column(
              children: [
                TSectionHeading(
                  title: AppLocalizations.of(context)!.popularProduct,
                  onPress: () => Get.to(() => AllProducts(
                        title: AppLocalizations.of(context)!.popularProduct,
                        query: FirebaseFirestore.instance
                            .collection('Products')
                            .where('IsFeature', isEqualTo: true)
                            .limit(6),
                        futureMethode: controller.fetchAllFeatureProducts(),
                      )),
                  showActionButton: true,
                  buttonTitle: AppLocalizations.of(context)!.viewAll,
                ),
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
                Obx(() {
                  if (controller.featuredProducts.isEmpty) {
                    return Center(
                      child: Text(
                        AppLocalizations.of(context)!.noData,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }
                  return TGridLayout(
                    itemCount: controller.featuredProducts.length,
                    itemBuilder: (_, index) => TProductCardVertical(
                      product: controller.featuredProducts[index],
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtWsections,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: TSizes.defaultSpace, right: TSizes.defaultSpace),
            child: TSectionHeading(
              title: AppLocalizations.of(context)!.clients,
              showActionButton: true,
              onPress: () => Get.to(() => const AllClientsScreen()),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtWItems / 2,
          ),
          const THomeClient(),
          const SizedBox(
            height: TSizes.spaceBtWsections,
          )
        ],
      )),
    );
  }
}
