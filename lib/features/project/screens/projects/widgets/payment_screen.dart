import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:brother_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TPaymentScreen extends StatelessWidget {
  const TPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Directionality(
        textDirection: Get.locale?.languageCode == 'en'
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: Scaffold(
          appBar: TAppBar(
            title: Text(
              'Payment For Project',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.primary),
            ),
            showBackArrow: true,
          ),
          body: const SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    children: [
                      TbillingPaymentSection(),
                    ],
                  ))),
        ));
  }
}
