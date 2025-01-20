import 'package:brother_store/features/authontication/controllers/forget_password/forget_passwprd_controller.dart';
import 'package:brother_store/features/authontication/screens/login/login.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({
    super.key,
    required this.email,
  });
  final String email;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Get.back(), icon: const Icon(Icons.close))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                Image(
                  image: const AssetImage(TImages.verifyIcon),
                  width: THelperFunctions.screenwidth() * 0.6,
                ),
                const SizedBox(
                  height: TSizes.spaceBtWsections,
                ),
                Text(
                  email,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
                Text(
                  "Change your password",
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
                Text(
                  "Your Account Security is Our Priority we 've sent you a secure link to Safty change your password and keep Your Account Protected",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: TSizes.spaceBtWsections,
                ),
                SizedBox(
                  width: THelperFunctions.screenwidth() * 0.6,
                  child: ElevatedButton(
                      onPressed: () => Get.offAll(() => const LoginScreen()),
                      child: Text(AppLocalizations.of(context)!.done)),
                ),
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => ForgetPasswordController.instance
                          .resendPasswordResetEmail(email),
                      child: Text(AppLocalizations.of(context)!.resendEmail)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
