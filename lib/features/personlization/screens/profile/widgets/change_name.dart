import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/features/personlization/controllers/update_name_controller.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            AppLocalizations.of(context)!.changeName,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          showBackArrow: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                Text(AppLocalizations.of(context)!.changeNameMessage,
                    style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(
                  height: TSizes.spaceBtWsections,
                ),
                Form(
                  key: controller.updateUseNameFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.firstName,
                        validator: (value) => TValidator.validateEmptyText(
                            AppLocalizations.of(context)!.firstName, value),
                        expands: false,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.user),
                            labelText: AppLocalizations.of(context)!.firstName),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      TextFormField(
                        controller: controller.lastName,
                        validator: (value) => TValidator.validateEmptyText(
                            AppLocalizations.of(context)!.lastName, value),
                        expands: false,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.user),
                            labelText: AppLocalizations.of(context)!.lastName),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtWsections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.updateUserName(),
                      child: Text(AppLocalizations.of(context)!.save)),
                )
              ],
            )),
      ),
    );
  }
}
//////////////
