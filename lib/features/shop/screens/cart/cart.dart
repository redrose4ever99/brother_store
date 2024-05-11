import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:brother_store/features/shop/screens/checkout/checkout.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // bool dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: const Text('Checkout \$23245')),
      ),
      body: const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace), child: TCartItems()),
    );
  }
}
