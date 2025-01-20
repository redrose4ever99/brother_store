import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/features/authontication/controllers/forget_password/forget_passwprd_controller.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:brother_store/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: const TAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Forget Password",
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: TSizes.spaceBtWsections,
                ),
                Text(
                  "Your Account Security is Our Priority we 've sent you a secure link to Safty change your password and keep Your Account Protected",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: TSizes.spaceBtWsections * 2,
                ),
                Form(
                  key: controller.forgetPasswordFormKey,
                  child: TextFormField(
                    controller: controller.email,
                    validator: (value) => TValidator.validateEmail(value),
                    decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.email,
                        prefixIcon: const Icon(Iconsax.direct_right)),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtWsections,
                ),
                Center(
                  child: SizedBox(
                    width: THelperFunctions.screenwidth() * 0.6,
                    child: ElevatedButton(
                        onPressed: () => controller.sendPasswordResetEmail(),
                        child: Text(AppLocalizations.of(context)!.submit)),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => controller.sendPasswordResetEmail(),
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
