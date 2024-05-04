// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:brother_store/common/widgets/layout/grid_layout.dart';
import 'package:brother_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:brother_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';

import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              TSearchContainer(
                text: 'Whats in your mind',
                icon: Iconsax.information,
                onTap: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtWsections,
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: TSizes.defaultSpace, right: TSizes.defaultSpace),
                child: Column(
                  children: [
                    TSectionHeading(
                      title: 'Popular Categories',
                      showActionButton: false,
                    ),
                    SizedBox(
                      height: TSizes.spaceBtWItems,
                    ),
                    //Home Categories
                    THomeCategories()
                  ],
                ),
              ),
            ],
          ))
          //body from here
          ,
          Padding(
            padding: const EdgeInsets.only(
                left: TSizes.defaultSpace, right: TSizes.defaultSpace),
            child: Column(
              children: [
                const TSectionHeading(
                  title: 'Gallery',
                  showActionButton: true,
                ),
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
                const TPromoSlider(
                  banners: [
                    TImages.bannerOne,
                    TImages.bannerTow,
                    TImages.bannerFour
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtWsections,
                ),
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
