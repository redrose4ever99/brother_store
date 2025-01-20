import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/features/project/controllers/project_controller.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:brother_store/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddNewPriceRequestScreen extends StatelessWidget {
  const AddNewPriceRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProjectController.instance;
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: const TAppBar(
          title: Text('Add New Price Request'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Form(
                key: controller.projectFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                            'Here you can send Request for any design maybe you like to do it for your home or office or garden'),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),
                        TextFormField(
                          controller: controller.name,
                          validator: (value) => TValidator.validateEmptyText(
                              AppLocalizations.of(context)!.country, value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.text),
                              labelText: 'Title'),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),
                        TextFormField(
                          maxLines: 3,
                          controller: controller.description,
                          validator: (value) => TValidator.validateEmptyText(
                              AppLocalizations.of(context)!.country, value),
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.description),
                              labelText:
                                  AppLocalizations.of(context)!.descriptions),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),
                        SizedBox(
                          width: THelperFunctions.screenwidth() / 2.5,
                          child: ElevatedButton(
                              onPressed: () {
                                controller.addNewProject();
                              },
                              child: const Text('Select File')),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),
                        SizedBox(
                          width: 100,
                          height: 200,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: THelperFunctions.screenwidth() / 2.5,
                      child: ElevatedButton(
                          onPressed: () {
                            controller.addNewProject();
                          },
                          child: const Text('Send')),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
