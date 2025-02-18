import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/features/shop/models/payment_method_model.dart';
import 'package:brother_store/features/shop/screens/checkout/widgets/payment_tile.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();
  final Rx<PaymentMethodModel> selectedPaymentMethode =
      PaymentMethodModel.empty().obs;

// Variables
  // final favorites = <String, bool>{}.obs;
  @override
  void onInit() {
    //screnSelect();
    selectedPaymentMethode.value =
        PaymentMethodModel(image: TImages.visaLogo, name: 'Visa');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethode(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(TSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TSectionHeading(
                        showActionButton: false,
                        title:
                            AppLocalizations.of(context)!.selectPaymentMethode),
                    const SizedBox(
                      height: TSizes.spaceBtWsections,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.visaLogo, name: 'Visa')),
                    const SizedBox(
                      height: TSizes.spaceBtWsections,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.masterLogo, name: 'Master')),
                    const SizedBox(
                      height: TSizes.spaceBtWsections,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.paypalLogo, name: 'Paypal'))
                  ],
                ),
              ),
            ));
  }
}
