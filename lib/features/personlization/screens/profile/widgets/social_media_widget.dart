import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/common/widgets/images/rounded_image.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialMediaVertical extends StatelessWidget {
  const SocialMediaVertical({super.key});

  @override
  Widget build(BuildContext context) {
    double width = 50;
    return TRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(TSizes.md),
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TRoundedImage(
            imageUrl: TImages.facebookIcon,
            width: width,
          ),
          TRoundedImage(imageUrl: TImages.instagramIcon, width: width),
          TRoundedImage(
            imageUrl: TImages.ticktockIcon,
            width: width,
          ),
          GestureDetector(
            onTap: () {
              String url = "https://wa.me/+971503780135/?text=Hi";
              launchUrlString(url);
            },
            child: TRoundedImage(
              imageUrl: TImages.whaatsupIcon,
              width: width,
            ),
          )
        ],
      ),
    );
  }
}
