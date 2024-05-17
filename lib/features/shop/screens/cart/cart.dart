import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:brother_store/features/shop/screens/checkout/checkout.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // bool dark = THelperFunctions.isDarkMode(context);
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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
              onPressed: () => Get.to(() => const CheckoutScreen()),
              child: Text(
                  AppLocalizations.of(context)!.checkoutWithPrice('232445'))),
        ),
        body: const Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace), child: TCartItems()),
      ),
    );
  }
}
