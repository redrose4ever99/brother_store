import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/features/project/controllers/project_controller.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:brother_store/utils/validators/validator.dart';
import 'package:country_picker/country_picker.dart';
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
        appBar: TAppBar(
          title: Text(AppLocalizations.of(context)!.addProject),
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
                          AppLocalizations.of(context)!.name, value),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.building),
                          labelText: AppLocalizations.of(context)!.projectName),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      maxLines: 3,
                      controller: controller.description,
                      validator: (value) => TValidator.validateEmptyText(
                          AppLocalizations.of(context)!.descriptions, value),
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
                      // validator: (value) => TValidator.validateEmptyText(
                      //     AppLocalizations.of(context)!.quantity, value),
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

                    ElevatedButton(
                      onPressed: () {
                        showCountryPicker(
                          context: context,

                          //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                          // exclude: <String>['KN', 'MF'],
                          favorite: <String>['SA'],
                          //Optional. Shows phone code before the country name.
                          showPhoneCode: false,

                          onSelect: (Country country) {
                            controller.country.text = country.displayName;
                            print('Select country: ${country.displayName}');
                          },

                          // Optional. Sheet moves when keyboard opens.

                          // Optional. Sets the theme for the country list picker.
                          countryListTheme: CountryListThemeData(
                            // Optional. Sets the border radius for the bottomsheet.
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                            // Optional. Styles the search field.
                            inputDecoration: InputDecoration(
                              labelText: 'Search',
                              hintText: 'Start typing to search',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      const Color(0xFF8C98A8).withOpacity(0.2),
                                ),
                              ),
                            ),
                            // Optional. Styles the text in the search field
                            searchTextStyle: const TextStyle(
                              color: TColors.primary,
                              fontSize: 18,
                            ),
                          ),
                        );
                      },
                      child: Text(AppLocalizations.of(context)!.country),
                    ),
                    // showCountryPicker(
                    //   context: context,
                    //   showPhoneCode:
                    //       true, // optional. Shows phone code before the country name.
                    //   onSelect: (Country country) {
                    //     print('Select country: ${country.displayName}');
                    //   },
                    // ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    SizedBox(
                      width: THelperFunctions.screenwidth() * 0.5,
                      child: ElevatedButton(
                          onPressed: () {
                            controller.addNewProject();
                          },
                          child: Text(AppLocalizations.of(context)!.send)),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
