import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/images/circular_image.dart';
import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
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
                        child: const Text('change profile picture'))
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
              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),

              const SizedBox(
                height: TSizes.spaceBtWItems,
              ),

              TProfileMenu(
                title: 'Name',
                value: 'Nuwar Saeed',
                onPress: () {},
              ),
              TProfileMenu(
                title: 'User Name',
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
              const TSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),

              const SizedBox(
                height: TSizes.spaceBtWItems,
              ),
              TProfileMenu(
                title: 'User TD',
                value: '419244',
                icon: Iconsax.copy,
                onPress: () {},
              ),

              TProfileMenu(
                title: 'E-mail',
                value: 'nuwar.m.saeed@gmail.com',
                onPress: () {},
              ),

              TProfileMenu(
                title: 'phone number',
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
                    child: const Text(
                      'Close Account',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}