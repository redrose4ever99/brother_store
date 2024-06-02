import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/images/circular_image.dart';
import 'package:brother_store/common/widgets/shimmers/shimmer.dart';
import 'package:brother_store/features/personlization/controllers/user_controller.dart';
import 'package:brother_store/features/personlization/screens/profile/profile.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:get/get.dart';

class THomeAppbar extends StatelessWidget {
  const THomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      actions: [
        GestureDetector(
          onTap: () => Get.to(() => const ProfileScreen()),
          child: Obx(() {
            final networkImage = controller.user.value.profilePicture;
            final image =
                networkImage.isNotEmpty ? networkImage : TImages.userImage;
            return networkImage.isNotEmpty
                ? CircleAvatar(
                    backgroundImage: NetworkImage(image),
                    radius: MediaQuery.of(context).size.height * 0.05,
                  )
                : CircleAvatar(
                    backgroundImage: AssetImage(image),
                    radius: MediaQuery.of(context).size.height * 0.05,
                  );
          }),
        )
      ],
      //leadingIcon: Icons.menu_outlined,
      //leadingOnPress: () => ZoomDrawer.of(context)!.toggle(),
      title: Row(
        children: [
          // IconButton(
          //     onPressed: () => ZoomDrawer.of(context)!.toggle(),
          //     icon: const Icon(
          //       Icons.menu_outlined,
          //       color: TColors.white,
          //     )),
          Image(
            image: AssetImage(Get.locale?.languageCode == 'en'
                ? TImages.wordWhite
                : TImages.arWord),
            width: 100,
            height: 50,
            color: TColors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Visibility(
            visible: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.goodDay,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: TColors.grey),
                ),
                Text(
                  'Nuwwar Saeed',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.white),
                )
              ],
            ),
          ),
        ],
      ),
      // actions: [
      //   TCartCounterIcon(
      //     iconColor: THelperFunctions.isDarkMode(context)
      //         ? TColors.white
      //         : TColors.black,
      //     onPress: () => Get.to(() => const CartScreen()),
      //   )
      //],
    );
  }
}
