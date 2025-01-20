import 'package:brother_store/common/styles/spacing_style.dart';
import 'package:brother_store/common/widgets/texts/form_divider.dart';
import 'package:brother_store/common/widgets/texts/social_buttons.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(Controller());
    final dark = THelperFunctions.isDarkMode(context);

    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        // appBar: AppBar(),
        // // appBar: TAppBar(
        // //   title: Text(AppLocalizations.of(context)!.register),
        // //   showBackArrow: true,
        // // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppbarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  height: 100,
                  image: Get.locale?.languageCode == 'en'
                      ? AssetImage(dark ? TImages.bwhite : TImages.bBlack)
                      : const AssetImage(
                          TImages.arWord,
                        ),
                  color: dark ? Colors.white : TColors.darkerGray,
                  width: 100,
                ),
                const SizedBox(
                  height: TSizes.sm,
                ),
                Text(
                  AppLocalizations.of(context)!.wellcomeBack,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: TSizes.sm,
                ),
                Text(
                  "Eiusmod duis sunt esse fugiat aliquip dolor duis in dolor dolore occaecat mollit ut. back",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: TSizes.spaceBtWsections,
                ),
                //Form

                const TLoginForm(),
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
                TFormDivider(
                  dividerText: AppLocalizations.of(context)!.orSignUpWith,
                ),
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
                const TSocialButtons()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
