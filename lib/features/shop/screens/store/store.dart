import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/appbar/tabbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:brother_store/common/widgets/layout/grid_layout.dart';
import 'package:brother_store/common/widgets/product.cart/cart_menu_icon.dart';
import 'package:brother_store/common/widgets/shimmers/brand_shimmer.dart';
import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/features/shop/controllers/brand_controller.dart';
import 'package:brother_store/features/shop/controllers/category_controller.dart';
import 'package:brother_store/features/shop/screens/store/category/category_tab.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'brand/all_brand.dart';
import 'brand/brand_card.dart';
import 'brand/brand_product.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final isEg = Get.locale?.languageCode == 'en';
    final categories = CategoryController.instance.featureCategories;
    return DefaultTabController(
      length: categories.length,
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
                        onPress: () => Get.to(() => const AllBrandScreen()),
                      ),
                      const SizedBox(height: TSizes.spaceBtWItems / 1.5),
                      Obx(() {
                        if (brandController.isLoading.value) {
                          return TBrandShummer(
                            itemCount: brandController.featureBrands.length,
                          );
                        }
                        if (brandController.featureBrands.isEmpty) {
                          return Center(
                            child: Text(
                              AppLocalizations.of(context)!.noData,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          );
                        }
                        return TGridLayout(
                            itemCount: brandController.featureBrands.length,
                            maxAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return TBrandCard(
                                showBorder: false,
                                brand: brandController.featureBrands[index],
                                onTap: () => Get.to(() => BrandProducts(
                                      brand:
                                          brandController.featureBrands[index],
                                    )),
                              );
                            });
                      })
                    ],
                  ),
                ),
                bottom: TTabbar(
                    tabs: isEg
                        ? categories
                            .map((category) => Tab(child: Text(category.name)))
                            .toList()
                        : categories
                            .map((category) =>
                                Tab(child: Text(category.arabicName)))
                            .toList()),
                
              )
            ];
          },
          // ignore: prefer_const_constructors
          body: TabBarView(
              children: categories
                  .map((category) => TCategoryTab(category: category))
                  .toList()),
        ),
      ),
    );
  }
}
