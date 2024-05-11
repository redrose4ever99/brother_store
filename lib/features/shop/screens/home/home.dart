// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:brother_store/common/widgets/layout/grid_layout.dart';
import 'package:brother_store/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:brother_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:brother_store/features/personlization/screens/blog/blog.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:flutter/material.dart';

import 'package:brother_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(children: [
          const TSettingMenuTile(
              icon: Iconsax.paperclip,
              title: 'Add Project',
              subTitle: 'you can Request for new Project ordecoration'),
          const TSettingMenuTile(
              icon: Icons.price_change,
              title: 'Request for Price',
              subTitle: 'sunt laboris commodo in.'),
          const TSettingMenuTile(
              icon: Iconsax.video,
              title: 'Request for interview',
              subTitle:
                  'Officia adipisicing culpa nulla magna incididunt velit consectetur irure.'),
          TSettingMenuTile(
              onTap: () => Get.to(() => const BlogScreen()),
              icon: Icons.newspaper,
              title: 'look at our news',
              subTitle: 'sunt laboris commodo in.'),
          const TSettingMenuTile(
              icon: Icons.offline_pin_rounded,
              title: 'check out our offers',
              subTitle:
                  'Officia adipisicing culpa nulla magna incididunt velit consectetur irure.'),
        ]),
      )),
      // floatingActionButton: const TCircularFabWidget(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const TPrimaryHeaderContainer(
              child: Column(
            children: [
              THomeAppbar(),
              SizedBox(
                height: TSizes.spaceBtWsections,
              ),

              TPromoSlider(
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
              SizedBox(
                height: TSizes.spaceBtWsections,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: TSizes.defaultSpace, right: TSizes.defaultSpace),
                child: TSectionHeading(
                  textColor: TColors.white,
                  title: 'Popular Categories',
                  showActionButton: false,
                ),
              ),
              SizedBox(
                height: TSizes.spaceBtWItems,
              ),
              THomeCategories(),
              SizedBox(
                height: TSizes.spaceBtWsections,
              )
            ],
          ))
          //body from here
          ,
          const Padding(
            padding: EdgeInsets.only(
                left: TSizes.defaultSpace, right: TSizes.defaultSpace),
            child: TSectionHeading(
              title: 'Gallery',
              showActionButton: true,
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtWItems,
          ),
          const TPromoSlider(
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
                  title: 'Popular Product',
                  onPress: () {},
                  showActionButton: true,
                ),
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
                TGridLayout(
                  itemCount: 8,
                  itemBuilder: (_, index) => const TProductCardVertical(),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
