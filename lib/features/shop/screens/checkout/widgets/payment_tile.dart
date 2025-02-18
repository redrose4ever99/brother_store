// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/features/shop/controllers/product/checkout_controller.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:brother_store/features/shop/models/payment_method_model.dart';
import 'package:get/get.dart';

class TPaymentTile extends StatelessWidget {
  const TPaymentTile({
    Key? key,
    required this.paymentMethod,
  }) : super(key: key);
  final PaymentMethodModel paymentMethod;
  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethode.value = paymentMethod;
        Get.back();
      },
      leading: TRoundedContainer(
        width: 75,
        height: 60,
        padding: const EdgeInsets.all(TSizes.sm),
        backgroundColor:
            THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.white,
        child: Image(
          image: AssetImage(paymentMethod.image),
          fit: BoxFit.contain,
        ),
      ),
      title: Text(paymentMethod.name),
      trailing: Icon(
        Get.locale?.languageCode == 'en'
            ? Icons.keyboard_arrow_right
            : Icons.keyboard_arrow_left,
        size: 30,
      ),
    );
  }
}
