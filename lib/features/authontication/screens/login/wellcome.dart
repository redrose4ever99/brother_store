import 'package:brother_store/app.dart';
import 'package:brother_store/bindings/general_binding.dart';
import 'package:brother_store/common/styles/spacing_style.dart';

import 'package:brother_store/features/authontication/screens/login/login.dart';
import 'package:brother_store/features/authontication/screens/register/register.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class WellcomScreen extends StatelessWidget {
  const WellcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Directionality(
        textDirection: Get.locale?.languageCode == 'en'
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: TSpacingStyle.paddingWithAppbarHeight,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: TSizes.spaceBtWsections,
                      ),
                      Image(
                          height: 100,
                          color: TColors.primary,
                          image: AssetImage(
                              dark ? TImages.bwhite : TImages.bBlack)),
                      const SizedBox(
                        height: TSizes.spaceBtWItems,
                      ),
                      Text(
                        'Wellcom to Brother Creative',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtWsections,
                      ),
                      Text(
                        'if you want to add orders or request for project you have to Register and join our family to injoy with our services , or if you hav an account you can simply login ',
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtWsections,
                      ),
                      SizedBox(
                          width: THelperFunctions.screenwidth() * 0.6,
                          child: ElevatedButton(
                              onPressed: () {
                                Get.to(const LoginScreen(),
                                    binding: GeneralBindings());
                              },
                              child: const Text('login'))),
                      const SizedBox(
                        height: TSizes.spaceBtWsections,
                      ),
                      SizedBox(
                          width: THelperFunctions.screenwidth() * 0.6,
                          child: ElevatedButton(
                              onPressed: () =>
                                  Get.to(() => const RegisterScreen()),
                              child: Text(AppLocalizations.of(context)!
                                  .createAccount))),
                      const SizedBox(
                        height: TSizes.spaceBtWsections,
                      ),
                      GestureDetector(
                          onTap: () => Get.to(() => const App()),
                          child: Text(
                            "continue as gust",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .apply(color: TColors.primary),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
