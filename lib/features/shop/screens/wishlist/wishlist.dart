import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/icons/circuler_icon.dart';
import 'package:brother_store/common/widgets/layout/grid_layout.dart';
import 'package:brother_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:brother_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:brother_store/features/shop/controllers/product/favorites_controller.dart';
import 'package:brother_store/features/shop/screens/store/store.dart';
import 'package:brother_store/navigation_menu.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            AppLocalizations.of(context)!.wishList,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCircularIcon(
              icon: Iconsax.add,
              onPressed: () {
                NavigationController.instance.selectedIndex.value = 1;
                Get.to(const NavigationMenu());
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Obx(
              () => FutureBuilder(
                  future: controller.favoritesProducts(),
                  builder: (context, snapshot) {
                    final emptyWidget = Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: TSizes.spaceBtWsections,
                        ),
                        Text(
                          AppLocalizations.of(context)!.wishlistIsEmpty,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),
                        ElevatedButton(
                            onPressed: () => Get.to(const StoreScreen()),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: TSizes.defaultSpace,
                                  right: TSizes.defaultSpace),
                              child: Text(
                                AppLocalizations.of(context)!.letsFillIt,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            )),
                      ],
                    ));

                    // TAnimationLoaderWidget(
                    //   text: AppLocalizations.of(context)!.wishlistIsEmpty,
                    //   animation: TImages.bwhite,
                    //   showAction: true,
                    //   actionText: AppLocalizations.of(context)!.letsFillIt,
                    // );
                    const loader = TVerticalProductShummer(
                      itemCount: 6,
                    );
                    final widget = TCloudHelperFunctions.checkMuiltiRecordState(
                        snapshot: snapshot,
                        loader: loader,
                        nothingFound: emptyWidget);
                    if (widget != null) return widget;
                    final product = snapshot.data!;

                    return TGridLayout(
                        itemCount: product.length,
                        itemBuilder: (_, index) => TProductCardVertical(
                              product: product[index],
                            ));
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
