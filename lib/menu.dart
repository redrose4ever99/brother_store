import 'package:brother_store/features/project/screens/projects/interview_request.dart';
import 'package:brother_store/features/project/screens/projects/price_request.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'common/widgets/list_tiles/setting_menu_tile.dart';
import 'features/personlization/screens/blog/blog.dart';
import 'features/project/screens/projects/add_new_project.dart';
import 'utils/constants/color.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color iconColor =
        THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black;
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGray
              : TColors.primary,
          body: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(children: [
              SizedBox(
                height: THelperFunctions.screenHeight() * 0.15,
              ),
              TSettingMenuTile(
                  onTap: () => Get.to(() => const AddNewProjectScreen()),
                  icon: Iconsax.paperclip,
                  iconColor: iconColor,
                  title: AppLocalizations.of(context)!.addProject,
                  subTitle: 'you can Request for new Project or decoration'),
              TSettingMenuTile(
                  onTap: () => Get.to(() => const PriceRequestScreen()),
                  icon: Icons.price_change,
                  iconColor: iconColor,
                  title: AppLocalizations.of(context)!.priceRequest,
                  subTitle: 'sunt laboris commodo in.'),
              TSettingMenuTile(
                  onTap: () => Get.to(() => const InterviewRequestScreen()),
                  icon: Iconsax.video,
                  iconColor: iconColor,
                  title: AppLocalizations.of(context)!.interviewRequest,
                  subTitle:
                      'Officia adipisicing culpa nulla magna incididunt velit consectetur irure.'),
              TSettingMenuTile(
                  onTap: () => Get.to(() => const BlogScreen()),
                  icon: Icons.newspaper,
                  iconColor: iconColor,
                  title: AppLocalizations.of(context)!.lookNews,
                  subTitle: 'sunt laboris commodo in.'),
              TSettingMenuTile(
                  icon: Icons.offline_pin_rounded,
                  iconColor: iconColor,
                  title: AppLocalizations.of(context)!.offersChick,
                  subTitle:
                      'Officia adipisicing culpa nulla magna incididunt velit consectetur irure.'),
            ]),
          )),
    );
  }
}
