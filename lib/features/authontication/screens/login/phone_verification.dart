import 'package:brother_store/common/styles/spacing_style.dart';
import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/features/authontication/controllers.onboarding/signup/otp_controller.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class PhoneVerificationScreen extends StatelessWidget {
  const PhoneVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(OtpController());
    String otp = ' ';
    final dark = THelperFunctions.isDarkMode(context);
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: const TAppBar(
          title: Text('verification'),
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
                      'Enter verification code here',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtWsections,
                    ),
                  ],
                ),
                Form(
                    child: Column(
                  children: [
                    OtpTextField(
                      mainAxisAlignment: MainAxisAlignment.center,
                      numberOfFields: 6,
                      fillColor: TColors.black.withOpacity(0.1),
                      filled: true,
                      onSubmit: (code) {
                        if (kDebugMode) {
                          print("========otp is $code ======");
                        }
                        otp = code;
                        otpController.verifyOtp(otp);
                      },
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtWsections,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () => otpController.verifyOtp(otp),
                            child: const Text('Continue')))
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
