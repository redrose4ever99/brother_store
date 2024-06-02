import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/features/shop/controllers/product/checkoutController.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class TbillingPaymentSection extends StatelessWidget {
  const TbillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(
          title: AppLocalizations.of(context)!.paymentMethod,
          buttonTitle: AppLocalizations.of(context)!.change,
          showActionButton: true,
          onPress: () {
            controller.selectPaymentMethode(context);
          },
        ),
        const SizedBox(
          height: TSizes.spaceBtWItems / 2,
        ),
        Obx(
          () => Row(
            children: [
              TRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? TColors.light : TColors.white,
                padding: const EdgeInsets.all(TSizes.sm),
                child: Image(
                  image:
                      AssetImage(controller.selectedPaymentMethode.value.image),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtWItems / 2,
              ),
              Text(controller.selectedPaymentMethode.value.name,
                  style: Theme.of(context).textTheme.bodyLarge)
            ],
          ),
        )
      ],
    );
  }
}
