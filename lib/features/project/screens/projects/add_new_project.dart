import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/features/project/controllers/project_controller.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddNewProjectScreen extends StatelessWidget {
  const AddNewProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProjectController.instance;
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: const TAppBar(
          title: Text('Add New Project'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Form(
                key: controller.projectFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.name,
                      validator: (value) => TValidator.validateEmptyText(
                          AppLocalizations.of(context)!.country, value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: 'Project Name'),
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
                    TextFormField(
                      maxLines: 1,
                      controller: controller.quantity,
                      validator: (value) => TValidator.validateEmptyText(
                          AppLocalizations.of(context)!.country, value),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.numbers),
                          labelText: AppLocalizations.of(context)!.quantity),
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
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //       onPressed: () {}, child: const Text('Load Files')),
                    // ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    SizedBox(
                      width: double.infinity,
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
