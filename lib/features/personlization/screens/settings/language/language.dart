import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool ar = Get.locale?.languageCode == 'ar';
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            AppLocalizations.of(context)!.chooseLanguage,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          showBackArrow: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  GetStorage().write('en', false);
                  Get.updateLocale(const Locale('ar'));
                  Get.reload();
                },
                child: TRoundedContainer(
                  padding: const EdgeInsets.all(TSizes.md),
                  width: double.infinity,
                  showBorder: true,
                  backgroundColor: ar
                      ? TColors.primary.withOpacity(0.5)
                      : Colors.transparent,
                  borderColor: ar
                      ? Colors.transparent
                      : THelperFunctions.isDarkMode(context)
                          ? TColors.darkerGray
                          : TColors.grey,
                  margin: const EdgeInsets.only(bottom: TSizes.spaceBtWItems),
                  child: Row(
                    children: [
                      const Image(
                        image: AssetImage(
                          TImages.arabicFlag,
                        ),
                        width: 30,
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtWItems,
                      ),
                      Text(
                        'العربية',
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtWItems / 2,
              ),
              GestureDetector(
                onTap: () {
                  GetStorage().write('en', true);
                  Get.updateLocale(const Locale('en'));
                  Get.reload();
                },
                child: TRoundedContainer(
                  padding: const EdgeInsets.all(TSizes.md),
                  width: double.infinity,
                  showBorder: true,
                  backgroundColor: ar
                      ? Colors.transparent
                      : TColors.primary.withOpacity(0.5),
                  borderColor: ar
                      ? THelperFunctions.isDarkMode(context)
                          ? TColors.darkerGray
                          : TColors.grey
                      : Colors.transparent,
                  margin: const EdgeInsets.only(bottom: TSizes.spaceBtWItems),
                  child: Row(
                    children: [
                      const Image(
                        image: AssetImage(
                          TImages.englishFlag,
                        ),
                        width: 30,
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtWItems,
                      ),
                      Text(
                        'English',
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
