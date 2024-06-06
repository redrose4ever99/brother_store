import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/loaders/animation_loading.dart';
import 'package:brother_store/features/shop/controllers/product/cart_controller.dart';
import 'package:brother_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:brother_store/features/shop/screens/checkout/checkout.dart';
import 'package:brother_store/navigation_menu.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // bool dark = THelperFunctions.isDarkMode(context);
    final controller = CartController.instance;
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            AppLocalizations.of(context)!.myCart,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          showBackArrow: true,
        ),
        bottomNavigationBar: controller.cartItems.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const CheckoutScreen()),
                    child: Obx(
                      () => Text(AppLocalizations.of(context)!
                          .checkoutWithPrice(
                              controller.totalOfCartPrice.value.toString())),
                    )),
              ),
        body: Obx(() {
          final emptyWidget = TAnimationLoaderWidget(
            text: AppLocalizations.of(context)!.cartIsEmpty,
            animation: TImages.bBlack,
            showAction: true,
            actionText: AppLocalizations.of(context)!.letsFillIt,
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          return controller.cartItems.value.isEmpty
              ? Container(
                  child: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: TSizes.appBarHeight,
                        ),
                        Center(
                            child: Text(
                          AppLocalizations.of(context)!.cartIsEmpty,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        )),
                        const SizedBox(
                          height: TSizes.appBarHeight,
                        ),
                        SizedBox(
                            width: 250,
                            child: ElevatedButton(
                                onPressed: () =>
                                    Get.off(() => const NavigationMenu()),
                                child: Text(
                                  AppLocalizations.of(context)!.letsFillIt,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(color: TColors.light),
                                ))

                            // OutlinedButton(
                            //     onPressed: () =>
                            //         Get.to(() => const NavigationMenu()),
                            //     style: OutlinedButton.styleFrom(
                            //         backgroundColor: TColors.dark),
                            //     child: Text(
                            //       AppLocalizations.of(context)!.letsFillIt,
                            //       style: Theme.of(context)
                            //           .textTheme
                            //           .bodyMedium!
                            //           .apply(color: TColors.light),
                            //     )),
                            )
                      ],
                    ),
                  ),
                )
              : const SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.all(TSizes.defaultSpace),
                      child: TCartItems()),
                );
        }),
      ),
    );
  }
}
