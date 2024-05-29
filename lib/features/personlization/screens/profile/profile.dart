import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/images/circular_image.dart';
import 'package:brother_store/common/widgets/shimmers/shimmer.dart';
import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/features/personlization/controllers/user_controller.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widgets/change_name.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    var iconbackData = Get.locale?.languageCode == 'en'
        ? Icons.keyboard_arrow_right
        : Icons.keyboard_arrow_left;
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            AppLocalizations.of(context)!.account,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                //-- profile picture
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Obx(() {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : TImages.userImage;
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
                                width: 80,
                                height: 80,
                              );
                      }),
                      TextButton(
                          onPressed: () {
                            controller.uploadUserProfilePicture();
                          },
                          child: Text(AppLocalizations.of(context)!
                              .changeProfilePicture))
                    ],
                  ),
                ),

                //Details
                const SizedBox(
                  height: TSizes.spaceBtWItems / 2,
                ),
                const Divider(),
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),

                /// profile info
                TSectionHeading(
                  title: AppLocalizations.of(context)!.profileInformation,
                  showActionButton: false,
                ),

                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),

                TProfileMenu(
                  title: AppLocalizations.of(context)!.name,
                  value: controller.user.value.fullName,
                  icon: iconbackData,
                  onPress: () => Get.to(() => const ChangeName()),
                ),
                // TProfileMenu(
                //   title: AppLocalizations.of(context)!.userName,
                //   value: 'Nuwar@Saeed',
                //   icon: iconbackData,
                //   onPress: () {},
                // ),
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
                const Divider(),
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),

                // personal info
                TSectionHeading(
                  title: AppLocalizations.of(context)!.personalInformation,
                  showActionButton: false,
                ),

                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
                TProfileMenu(
                  title: AppLocalizations.of(context)!.userId,
                  value: controller.user.value.id ?? '',
                  icon: Iconsax.copy,
                  onPress: () {},
                ),

                TProfileMenu(
                  title: AppLocalizations.of(context)!.email,
                  value: controller.user.value.email ?? '',
                  icon: iconbackData,
                  onPress: () {},
                ),

                TProfileMenu(
                  title: AppLocalizations.of(context)!.phoneNumber,
                  value: controller.user.value.phoneNumber ?? '',
                  icon: iconbackData,
                  onPress: () {},
                ),
                const Divider(),
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
                // Center(
                //   child: TextButton(
                //       onPressed: () {},
                //       child: Text(
                //         AppLocalizations.of(context)!.closeAccount,
                //         style: const TextStyle(color: Colors.red, fontSize: 15),
                //       )),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
