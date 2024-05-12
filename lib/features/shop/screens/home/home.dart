// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:brother_store/common/widgets/layout/grid_layout.dart';
import 'package:brother_store/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:brother_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:brother_store/features/personlization/screens/blog/blog.dart';
import 'package:brother_store/features/project/screens/projects/add_new_project.dart';
import 'package:brother_store/features/project/screens/projects/interview_request.dart';
import 'package:brother_store/features/project/screens/projects/price_request.dart';
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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(children: [
          TSettingMenuTile(
              onTap: () => Get.to(() => const AddNewProjectScreen()),
              icon: Iconsax.paperclip,
              title: AppLocalizations.of(context)!.addProject,
              subTitle: 'you can Request for new Project or decoration'),
          TSettingMenuTile(
              onTap: () => Get.to(() => const PriceRequestScreen()),
              icon: Icons.price_change,
              title: AppLocalizations.of(context)!.priceRequest,
              subTitle: 'sunt laboris commodo in.'),
          TSettingMenuTile(
              onTap: () => Get.to(() => const InterviewRequestScreen()),
              icon: Iconsax.video,
              title: AppLocalizations.of(context)!.interviewRequest,
              subTitle:
                  'Officia adipisicing culpa nulla magna incididunt velit consectetur irure.'),
          TSettingMenuTile(
              onTap: () => Get.to(() => const BlogScreen()),
              icon: Icons.newspaper,
              title: AppLocalizations.of(context)!.lookNews,
              subTitle: 'sunt laboris commodo in.'),
          TSettingMenuTile(
              icon: Icons.offline_pin_rounded,
              title: AppLocalizations.of(context)!.offersChick,
              subTitle:
                  'Officia adipisicing culpa nulla magna incididunt velit consectetur irure.'),
        ]),
      )),
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
                  title: AppLocalizations.of(context)!.popularProduct,
                  onPress: () {},
                  showActionButton: true,
                  buttonTitle: AppLocalizations.of(context)!.viewAll,
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
