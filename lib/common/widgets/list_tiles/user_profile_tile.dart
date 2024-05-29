import 'package:brother_store/common/widgets/images/circular_image.dart';
import 'package:brother_store/common/widgets/shimmers/shimmer.dart';
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
            : TCircularImage(
                image: image,
                fit: BoxFit.contain,
                isNetworkImage: networkImage.isNotEmpty,
                width: 50,
                height: 50,
              );
      }),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        controller.user.value.email ?? 'User Email',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        icon: const Icon(Iconsax.edit, color: TColors.white),
        onPressed: () => Get.to(() => const ProfileScreen()),
      ),
    );
  }
}
