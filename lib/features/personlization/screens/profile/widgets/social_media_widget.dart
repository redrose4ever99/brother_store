import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/icons_string.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialMediaVertical extends StatelessWidget {
  const SocialMediaVertical({super.key});

  @override
  Widget build(BuildContext context) {
    double width = 35;
    Color iconColor =
        THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark;
    return TRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(TSizes.md),
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //   Icon(Iconsax.instagram, size: width),
          //Icon(icon: Iconsax.instagram),
          SvgPicture.asset(
            TIcons.xIcon,
            width: width,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          SvgPicture.asset(
            TIcons.tiktokIcon,
            width: width,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          SvgPicture.asset(
            TIcons.instagramIcon,
            width: width + 5,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          GestureDetector(
            onTap: () {
              String url = "https://wa.me/+971503780135/?text=Hi";
              launchUrlString(url);
            },
            child: SvgPicture.asset(
              TIcons.whatsupIcon,
              width: width,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
          )
        ],
      ),
    );
  }
}
