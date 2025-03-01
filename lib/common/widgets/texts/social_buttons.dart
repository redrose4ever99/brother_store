import 'package:brother_store/features/authontication/controllers/login/login_controller.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/icons_string.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/devices/device_utility.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    bool dark = THelperFunctions.isDarkMode(context);
    final iconColor = dark ? TColors.black : TColors.white;
    final iconback = dark ? TColors.white : TColors.black;
    final apple = TDeviceUtils.isIos();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: apple,
          child: Container(
            width: 100,
            height: 50,
            decoration: BoxDecoration(
                color: iconback,
                border: Border.all(color: iconColor),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  TIcons.appleIcon,
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ),
        if (apple)
          const SizedBox(
            width: TSizes.spaceBtWItems,
          ),
        Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
              color: iconback,
              border: Border.all(color: iconColor),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: InkWell(
              onTap: () => controller.googleSignIn(),
              child: SvgPicture.asset(
                TIcons.gmailIcon,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
          ),
        ),
        // const SizedBox(
        //   width: TSizes.spaceBtWItems,
        // ),
        // Container(
        //   width: 50,
        //   height: 50,
        //   decoration: BoxDecoration(
        //       border: Border.all(color: iconColor),
        //       borderRadius: BorderRadius.circular(100)),
        //   child: Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: InkWell(
        //       onTap: () {},
        //       child: SvgPicture.asset(
        //         TIcons.facebookIcon,
        //         colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
