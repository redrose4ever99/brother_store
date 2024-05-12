import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/images/circular_image.dart';
import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(AppLocalizations.of(context)!.account),
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
                    const TCircularImage(
                      image: TImages.userImage,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                            AppLocalizations.of(context)!.changeProfilePicture))
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
                value: 'Nuwar Saeed',
                onPress: () {},
              ),
              TProfileMenu(
                title: AppLocalizations.of(context)!.userName,
                value: 'Nuwar@Saeed',
                onPress: () {},
              ),
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
                value: '419244',
                icon: Iconsax.copy,
                onPress: () {},
              ),

              TProfileMenu(
                title: AppLocalizations.of(context)!.email,
                value: 'nuwar.m.saeed@gmail.com',
                onPress: () {},
              ),

              TProfileMenu(
                title: AppLocalizations.of(context)!.phoneNumber,
                value: '+963941141460',
                onPress: () {},
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtWItems,
              ),
              Center(
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!.closeAccount,
                      style: const TextStyle(color: Colors.red, fontSize: 15),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
