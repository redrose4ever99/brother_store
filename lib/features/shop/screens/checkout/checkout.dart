import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/common/widgets/products/cart/coupon_code.dart';
import 'package:brother_store/common/widgets/success_screen/success_screen.dart';
import 'package:brother_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:brother_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:brother_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:brother_store/navigation_menu.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                  image: dark
                      ? TImages.truePaymentblack
                      : TImages.truePaymentwhite,
                  title: 'Payment Successfull',
                  subTitle: 'Your Item will be shipping soon!',
                  onPressed: () => Get.offAll(() => const NavigationMenu()),
                )),
            child: const Text('Checkout \$23245')),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            const TCartItems(
              showAddRemoveButtons: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtWsections,
            ),

            ///Copoun code
            const TCouponCode(),
            const SizedBox(
              height: TSizes.spaceBtWsections,
            ),
            TRoundedContainer(
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                padding: const EdgeInsets.all(TSizes.md),
                child: const Column(
                  children: [
                    TBillingAmountSection(),
                    SizedBox(
                      height: TSizes.spaceBtWItems,
                    ),
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtWItems,
                    ),
                    TbillingPaymentSection(),
                    SizedBox(
                      height: TSizes.spaceBtWItems,
                    ),
                    TBillingAddressSection(),
                    SizedBox(
                      height: TSizes.spaceBtWItems,
                    ),
                  ],
                )),
          ],
        ),
      )),
    );
  }
}
