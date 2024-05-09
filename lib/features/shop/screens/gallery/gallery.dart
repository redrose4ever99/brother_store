import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/appbar/tabbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:brother_store/common/widgets/images/rounded_image.dart';
import 'package:brother_store/common/widgets/layout/grid_gallery_layout.dart';
import 'package:brother_store/common/widgets/product.cart/cart_menu_icon.dart';
import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TGalleryScreen extends StatelessWidget {
  const TGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            "Gallery",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(
              iconColor: THelperFunctions.isDarkMode(context)
                  ? TColors.white
                  : TColors.black,
              onPress: () {},
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                floating: false,
                pinned: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 150,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      SizedBox(height: TSizes.spaceBtWItems),
                      TSearchContainer(
                        text: 'Search in Gallery',
                        showBorder: true,
                        padding: EdgeInsets.zero,
                        icon: Iconsax.search_normal,
                        showBackground: false,
                      ),
                      // const SizedBox(height: TSizes.spaceBtWsections),
                      // TSectionHeading(
                      //   title: 'Added Resently',
                      //   showActionButton: true,
                      //   onPress: () {},
                      // ),
                      // const SizedBox(height: TSizes.spaceBtWItems / 1.5),
                      // TGridLayout(
                      //     itemCount: 4,
                      //     maxAxisExtent: 80,
                      //     itemBuilder: (_, index) {
                      //       return const TBrandCard(
                      //         showBorder: false,
                      //       );
                      //     })
                    ],
                  ),
                ),
                bottom: const TTabbar(tabs: [
                  Tab(
                    child: Text('Album1'),
                  ),
                  Tab(
                    child: Text('Album2'),
                  ),
                  Tab(
                    child: Text('Album3'),
                  ),
                  Tab(
                    child: Text('Album4'),
                  ),
                  Tab(
                    child: Text('Album5'),
                  ),
                  Tab(
                    child: Text('Album6'),
                  ),
                  Tab(
                    child: Text('Album7'),
                  )
                ]),
              )
            ];
          },
          // ignore: prefer_const_constructors
          body: TabBarView(children: const [
            TTabGalleryView(),
            TTabGalleryView(),
            TTabGalleryView(),
            TTabGalleryView(),
            TTabGalleryView(),
            TTabGalleryView(),
            TTabGalleryView(),
          ]),
        ),
      ),
    );
  }
}

class TTabGalleryView extends StatelessWidget {
  const TTabGalleryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //-- Brands
              // const TBrandShowCase(
              //   images: [
              //     TImages.brandImage1,
              //     TImages.brandImage2,
              //     TImages.productImg1
              //   ],
              // ),

              TSectionHeading(
                title: 'Paces of Art',
                showActionButton: true,
                onPress: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtWItems,
              ),
              TGridGalleryLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const TRoundedImage(
                        imageUrl: TImages.bannerOne,
                        width: 100,
                        height: 100,
                      )),
              const SizedBox(
                height: TSizes.spaceBtWsections,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
