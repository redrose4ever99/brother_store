import 'package:brother_store/app.dart';
import 'package:brother_store/features/authontication/controllers/login/login_controller.dart';
import 'package:brother_store/features/authontication/screens/register/forget_password.dart';
import 'package:brother_store/features/authontication/screens/register/register.dart';
//import 'package:brother_store/features/general/controllers/brother_controller.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:brother_store/utils/validators/validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    // final isEg = Get.locale?.languageCode == 'en';
    // final brotherData = BrothersController.instance.allData;
    final controller = Get.put(LoginController());

    // final dark = THelperFunctions.isDarkMode(context);
    return Form(
        key: controller.loginFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
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
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye))),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtWItems,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: 20,
                        height: 20,
                        child: Obx(() => Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (value) => controller.rememberMe.value =
                                !controller.rememberMe.value))),
                    const SizedBox(
                      width: TSizes.spaceBtWItems / 3,
                    ),
                    Text(AppLocalizations.of(context)!.rememberMe),
                  ],
                ),
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: Text(
                      AppLocalizations.of(context)!.forgetPassword,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: TColors.primary),
                    ))
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtWItems,
            ),
            SizedBox(
                width: THelperFunctions.screenwidth() / 2.5,
                height: 60,
                child: ElevatedButton(
                    onPressed: () {
                      if (controller.loginFormKey.currentState!.validate()) {
                        controller.emailAndPasswordSignin();
                        // controller.phoneAuthentication(
                        //     controller.phoneNumber.text.trim());
                      }
                    },
                    child: Text(AppLocalizations.of(context)!.login))),
            const SizedBox(
              height: TSizes.spaceBtWItems,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: " ${AppLocalizations.of(context)!.iDontHaveAcount} ",
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Get.to(
                        () => const RegisterScreen(),
                      ),
                text: AppLocalizations.of(context)!.register,
                style: Theme.of(context).textTheme.bodySmall!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary),
              ),
            ])),
            // SizedBox(
            //     width: THelperFunctions.screenwidth() / 2.5,
            //     child: ElevatedButton(
            //         onPressed: () => Get.to(() => const RegisterScreen()),
            //         child: Text(AppLocalizations.of(context)!.createAccount))),
            const SizedBox(
              height: TSizes.spaceBtWsections,
            ),
            GestureDetector(
                onTap: () => Get.to(() => const App()),
                child: Text(
                  AppLocalizations.of(context)!.continuAsGuest,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.primary),
                ))
          ],
        ));
  }
}
