import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/features/shop/controllers/address_controller.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:brother_store/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            AppLocalizations.of(context)!.addNewAddress,
            //  style: Theme.of(context).textTheme.headlineSmall,
          ),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Form(
                key: controller.addressFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.name,
                      validator: (value) => TValidator.validateEmptyText(
                          AppLocalizations.of(context)!.name, value),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.user),
                          labelText: AppLocalizations.of(context)!.name),
                    ), //phoneNumber
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      controller: controller.phoneNumber,
                      validator: (value) =>
                          TValidator.validatePhoneNumber(value),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.mobile),
                          labelText: AppLocalizations.of(context)!.phoneNumber),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.street,
                            validator: (value) => TValidator.validateEmptyText(
                                AppLocalizations.of(context)!.street, value),
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Iconsax.building_31),
                                labelText:
                                    AppLocalizations.of(context)!.street),
                          ),
                        ),
                        const SizedBox(
                          width: TSizes.spaceBtwInputFields,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: controller.postalCode,
                            validator: (value) => TValidator.validateEmptyText(
                                AppLocalizations.of(context)!.postalCode,
                                value),
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Iconsax.code_1),
                                labelText:
                                    AppLocalizations.of(context)!.postalCode),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.city,
                            validator: (value) => TValidator.validateEmptyText(
                                AppLocalizations.of(context)!.city, value),
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Iconsax.building),
                                labelText: AppLocalizations.of(context)!.city),
                          ),
                        ),
                        const SizedBox(
                          width: TSizes.spaceBtwInputFields,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: controller.country,
                            validator: (value) => TValidator.validateEmptyText(
                                AppLocalizations.of(context)!.country, value),
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Iconsax.activity),
                                labelText:
                                    AppLocalizations.of(context)!.country),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      controller: controller.details,
                      maxLines: 3,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.document),
                          labelText: AppLocalizations.of(context)!.details),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    SizedBox(
                      width: THelperFunctions.screenwidth() * 0.6,
                      child: ElevatedButton(
                          onPressed: () => controller.addNewAddress(),
                          child: Text(AppLocalizations.of(context)!.save)),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
