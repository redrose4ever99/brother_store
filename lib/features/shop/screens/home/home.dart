// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:brother_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:brother_store/common/widgets/layout/grid_layout.dart';
import 'package:brother_store/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:brother_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/features/gallery/screen/gallery.dart';
import 'package:brother_store/features/personlization/screens/blog/blog.dart';
import 'package:brother_store/features/personlization/screens/profile/brothers.dart';
import 'package:brother_store/features/project/screens/prices/add_new_price_request.dart';
import 'package:brother_store/features/project/screens/projects/add_new_project.dart';
import 'package:brother_store/features/shop/controllers/product/product_controller.dart';
import 'package:brother_store/features/shop/screens/all_products/all_products.dart';
import 'package:brother_store/features/shop/screens/home/widgets/album_list.dart';
import 'package:brother_store/features/shop/screens/home/widgets/gallery_slider%20.dart';
import 'package:brother_store/features/shop/screens/sale_product/sale_product.dart';
import 'package:brother_store/features/shop/screens/store/clients/all_clients.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:brother_store/utils/loader/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import 'widgets/home_clients.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    //Get.updateLocale(const Locale('en'));
    Color iconColor =
        THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark;
    return SafeArea(
      child: Scaffold(
        endDrawer: TDrawer(iconColor: iconColor),
        drawer: TDrawer(iconColor: iconColor),
        // floatingActionButton: const TCircularFabWidget(),
        body: SingleChildScrollView(
            child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 18.0),
                  child: THomeAppbar(),
                ),
                const SizedBox(
                  height: TSizes.spaceBtWsections / 2,
                ),
                //   Text(Get.locale!.languageCode),
                const TPromoSlider(),
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
            ),
            const SizedBox(
              height: TSizes.spaceBtWsections,
            ),
            const TAlbumList(),
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
            //const TMovingText(),

            //show albums here
            //  const TAlbumTitle(),

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
              height: TSizes.spaceBtWsections * 1.2,
            )
          ],
        )),
      ),
    );
  }
}

class TDrawer extends StatelessWidget {
  const TDrawer({
    super.key,
    required this.iconColor,
  });

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: TSizes.appBarHeight,
              ),
              GestureDetector(
                onTap: () => Get.to(() => const BrotherScreen()),
                child: const Image(
                  image: AssetImage(TImages.wordWhite),
                  width: 100,
                  height: 50,
                  color: TColors.primary,
                ),
              ),
              // Image(
              //   image: AssetImage(Get.locale?.languageCode == 'en'
              //       ? TImages.wordWhite
              //       : TImages.arWord),
              //   width: 100,
              //   height: 50,
              //   color: TColors.primary,
              // ),
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    TSettingMenuTile(
                        onTap: () => Get.to(() => const AddNewProjectScreen()),
                        icon: Iconsax.element_plus,
                        iconColor: iconColor,
                        title: AppLocalizations.of(context)!.addProject,
                        subTitle:
                            'you can Request for new Project or decoration'),
                    TSettingMenuTile(
                        onTap: () =>
                            Get.to(() => const AddNewPriceRequestScreen()),
                        icon: Iconsax.discount_shape4,
                        iconColor: iconColor,
                        title: AppLocalizations.of(context)!.priceRequest,
                        subTitle: 'sunt laboris commodo in.'),
                    Visibility(
                      visible: false,
                      child: TSettingMenuTile(
                          onTap: () =>
                              TLoader.warningSnackBar(title: 'comming soon'),
                          icon: Iconsax.video,
                          iconColor: iconColor,
                          title: AppLocalizations.of(context)!.interviewRequest,
                          subTitle:
                              'Officia adipisicing culpa nulla magna incididunt velit consectetur irure.'),
                    ),
                    TSettingMenuTile(
                        onTap:
                            () => // TLoader.warningSnackBar(title: 'comming soon'),
                                Get.to(() => const BlogScreen()),
                        icon: Icons.menu_book_outlined,
                        iconColor: iconColor,
                        title: AppLocalizations.of(context)!.lookNews,
                        subTitle: 'sunt laboris commodo in.'),
                    TSettingMenuTile(
                        onTap: () => Get.to(const SaleProducts()),
                        icon: Icons.discount_outlined,
                        iconColor: iconColor,
                        title: AppLocalizations.of(context)!.offersChick,
                        subTitle:
                            'Officia adipisicing culpa nulla magna incididunt velit consectetur irure.'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
