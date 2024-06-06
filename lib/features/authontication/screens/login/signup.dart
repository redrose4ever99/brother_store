import 'package:brother_store/app.dart';
import 'package:brother_store/common/styles/spacing_style.dart';
import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/features/authontication/controllers.onboarding/signup/signup_controller.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:brother_store/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final dark = THelperFunctions.isDarkMode(context);
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: const TAppBar(
          title: Text('Register'),
          showBackArrow: true,
        ),
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
                        image:
                            AssetImage(dark ? TImages.bwhite : TImages.bBlack)),
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
                  ],
                ),
                Form(
                    key: controller.signupFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) =>
                              TValidator.validatePhoneNumber(value),
                          controller: controller.phoneNumber,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtWsections,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (controller.signupFormKey.currentState!
                                      .validate()) {
                                    controller.phoneAuthentication(
                                        controller.phoneNumber.text.trim());
                                  }
                                },
                                child: const Text('Register'))),
                        const SizedBox(
                          height: TSizes.spaceBtWsections,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () => Get.to(() => const App()),
                                child: const Text('Continue as gust')))
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
