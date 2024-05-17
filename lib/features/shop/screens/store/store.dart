import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/appbar/tabbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:brother_store/common/widgets/layout/grid_layout.dart';
import 'package:brother_store/common/widgets/product.cart/cart_menu_icon.dart';
import 'package:brother_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/features/shop/screens/store/brand_card.dart';
import 'package:brother_store/features/shop/screens/store/brand_show_case.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            AppLocalizations.of(context)!.store,
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
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: TSizes.spaceBtWItems),
                      TSearchContainer(
                        text: AppLocalizations.of(context)!.storeSearch,
                        showBorder: true,
                        padding: EdgeInsets.zero,
                        icon: Iconsax.search_normal,
                        showBackground: false,
                      ),
                      const SizedBox(height: TSizes.spaceBtWsections),
                      TSectionHeading(
                        title: AppLocalizations.of(context)!.featureBrands,
                        showActionButton: true,
                        buttonTitle: AppLocalizations.of(context)!.viewAll,
                        onPress: () {},
                      ),
                      const SizedBox(height: TSizes.spaceBtWItems / 1.5),
                      TGridLayout(
                          itemCount: 4,
                          maxAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const TBrandCard(
                              showBorder: false,
                            );
                          })
                    ],
                  ),
                ),
                bottom: const TTabbar(tabs: [
                  Tab(
                    child: Text('Furniture'),
                  ),
                  Tab(
                    child: Text('Garden Stuff'),
                  ),
                  Tab(
                    child: Text('Kitchens'),
                  ),
                  Tab(
                    child: Text('Salons'),
                  ),
                  Tab(
                    child: Text('bed Rooms'),
                  ),
                  Tab(
                    child: Text('Children Rooms'),
                  ),
                  Tab(
                    child: Text('Accessories'),
                  )
                ]),
              )
            ];
          },
          // ignore: prefer_const_constructors
          body: TabBarView(children: const [
            TTabView(),
            TTabView(),
            TTabView(),
            TTabView(),
            TTabView(),
            TTabView(),
            TTabView(),
          ]),
        ),
      ),
    );
  }
}

class TTabView extends StatelessWidget {
  const TTabView({
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
              const TBrandShowCase(
                images: [
                  TImages.brandImage1,
                  TImages.brandImage2,
                  TImages.productImg1
                ],
              ),

              TSectionHeading(
                title: AppLocalizations.of(context)!.youMightLike,
                showActionButton: true,
                buttonTitle: AppLocalizations.of(context)!.viewAll,
                onPress: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtWItems,
              ),
              TGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const TProductCardVertical()),
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
