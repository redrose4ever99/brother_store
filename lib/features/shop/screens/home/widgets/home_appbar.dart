import 'package:brother_store/features/personlization/controllers/user_controller.dart';
import 'package:brother_store/features/personlization/screens/profile/brothers.dart';
import 'package:brother_store/features/personlization/screens/profile/profile.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class THomeAppbar extends StatelessWidget {
  const THomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: TSizes.appBarHeight,
        child: Padding(
          padding: const EdgeInsets.only(
              left: TSizes.defaultSpace, right: TSizes.defaultSpace / 1.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () => Get.locale?.languageCode == 'en'
                          ? Scaffold.of(context).openEndDrawer()
                          : Scaffold.of(context).openDrawer(),
                      child: Transform.rotate(
                        angle: 90 * 3.14 / 180,
                        child: const Icon(
                          Iconsax.more4,
                          // Iconsax.add_circle,
                          size: 25,
                          color: TColors.light,
                        ),
                      )),
                  GestureDetector(
                    onTap: () => Get.to(() => const ProfileScreen()),
                    child: SizedBox(
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Obx(() {
                          final networkImage =
                              controller.user.value.profilePicture;
                          final image = networkImage.isNotEmpty
                              ? networkImage
                              : TImages.userImage;
                          return networkImage.isNotEmpty
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(image),
                                  radius:
                                      MediaQuery.of(context).size.height * 0.05,
                                )
                              : CircleAvatar(
                                  backgroundImage: AssetImage(image),
                                  radius:
                                      MediaQuery.of(context).size.height * 0.05,
                                );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Get.to(() => const BrotherScreen()),
                child: Image(
                  image: AssetImage(Get.locale?.languageCode == 'en'
                      ? TImages.wordWhite
                      : TImages.wordWhite),
                  width: 120,
                  height: 50,
                  color: TColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
