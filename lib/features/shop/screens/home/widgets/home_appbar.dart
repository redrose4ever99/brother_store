import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/features/personlization/controllers/user_controller.dart';
import 'package:brother_store/features/personlization/screens/profile/brothers.dart';
import 'package:brother_store/features/personlization/screens/profile/profile.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
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
      textDirection: TextDirection.ltr,
      child: TAppBar(
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => const ProfileScreen()),
            child: SizedBox(
              width: 75,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Obx(() {
                  final networkImage = controller.user.value.profilePicture;
                  final image = networkImage.isNotEmpty
                      ? networkImage
                      : TImages.userImage;
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
              ),
            ),
          ),
          GestureDetector(
              onTap: () => Get.locale?.languageCode == 'en'
                  ? Scaffold.of(context).openEndDrawer()
                  : Scaffold.of(context).openDrawer(),
              child: const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Iconsax.add_circle,
                  size: 30,
                  color: TColors.light,
                ),
              )),
        ],
        //leadingIcon: Icons.menu_outlined,
        //leadingOnPress: () => ZoomDrawer.of(context)!.toggle(),
        title: GestureDetector(
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
        // leadingOnPress:  () => Get.to(() => const BrotherScreen()),
        // leadingIcon: Iconsax.add_circle,

        // actions: [
        //   TCartCounterIcon(
        //     iconColor: THelperFunctions.isDarkMode(context)
        //         ? TColors.white
        //         : TColors.black,
        //     onPress: () => Get.to(() => const CartScreen()),
        //   )
        //],
      ),
    );
  }
}
