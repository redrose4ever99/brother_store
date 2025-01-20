import 'package:brother_store/common/widgets/shimmers/shimmer.dart';
import 'package:brother_store/data/repositoies/authentication/authentication_repository.dart';
import 'package:brother_store/features/authontication/screens/register/register.dart';

import 'package:brother_store/features/personlization/controllers/user_controller.dart';
import 'package:brother_store/features/personlization/screens/profile/profile.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
        leading: Obx(() {
          final networkImage = controller.user.value.profilePicture;
          final image =
              networkImage.isNotEmpty ? networkImage : TImages.userImage;
          return controller.imageUploading.value
                  ? const TShimmerEffect(
                      width: 80,
                      height: 80,
                      raduis: 80,
                    )
                  : networkImage.isNotEmpty
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(image),
                          radius: MediaQuery.of(context).size.height * 0.05,
                        )
                      : CircleAvatar(
                          backgroundImage: AssetImage(image),
                          radius: MediaQuery.of(context).size.height * 0.05,
                        )
              // TCircularImage(
              //     image: image,
              //     fit: BoxFit.contain,
              //     isNetworkImage: networkImage.isNotEmpty,
              //     width: 50,
              //     height: 50,
              //   )
              ;
        }),
        title: Text(
          controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white),
        ),
        subtitle: Text(
          controller.user.value.email ?? 'Gust',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.white),
        ),
        trailing: AuthenticationRepository.instance.isGust.value
            ? IconButton(
                icon: const Icon(Iconsax.login, color: TColors.white),
                //onPressed: () => Get.to(() => const ProfileScreen()),
                onPressed: () =>
                    Get.to(() => const RegisterScreen()) // RegisterScreen()),
                )
            : IconButton(
                icon: const Icon(Iconsax.edit, color: TColors.white),
                //onPressed: () => Get.to(() => const ProfileScreen()),
                onPressed: () =>
                    Get.to(() => const ProfileScreen()) // RegisterScreen()),
                ));
  }
}
