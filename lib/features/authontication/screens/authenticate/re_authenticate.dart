import 'package:brother_store/common/styles/spacing_style.dart';
import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/features/personlization/controllers/user_controller.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:brother_store/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthenticateScreen extends StatelessWidget {
  const ReAuthenticateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    //final dark = THelperFunctions.isDarkMode(context);

    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(AppLocalizations.of(context)!.reAuthenticate),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppbarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                    key: controller.reauthenticateFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.verifyEmail,
                          validator: (value) => TValidator.validateEmail(value),
                          decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.email,
                              prefixIcon: const Icon(Iconsax.direct)),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),
                        Obx(
                          () => TextFormField(
                            validator: (value) => TValidator.validateEmptyText(
                                AppLocalizations.of(context)!.password, value),
                            controller: controller.verifyPassword,
                            obscureText: controller.hidePassword.value,
                            decoration: InputDecoration(
                                labelText:
                                    AppLocalizations.of(context)!.password,
                                prefixIcon: const Icon(Iconsax.password_check),
                                suffixIcon: IconButton(
                                    onPressed: () => controller.hidePassword
                                        .value = !controller.hidePassword.value,
                                    icon: Icon(controller.hidePassword.value
                                        ? Iconsax.eye_slash
                                        : Iconsax.eye))),
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtWsections,
                        ),
                        SizedBox(
                            width: THelperFunctions.screenwidth() * 0.6,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (controller
                                      .reauthenticateFormKey.currentState!
                                      .validate()) {
                                    controller.reAuthenticateEmailAndPassword();
                                  }
                                },
                                child: Text(
                                    AppLocalizations.of(context)!.verify))),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
