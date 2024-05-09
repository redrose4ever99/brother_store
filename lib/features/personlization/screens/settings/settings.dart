import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:brother_store/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:brother_store/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/features/shop/screens/cart/cart.dart';
import 'package:brother_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:brother_store/navigation_menu.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../address/address.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                  title: Text(
                    'Acount',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),
                const TUserProfileTile(),
                const SizedBox(
                  height: TSizes.spaceBtWsections,
                )
              ],
            )),

            ///body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //-- acount settings
                  const TSectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(
                    height: TSizes.spaceBtWItems,
                  ),
                  TSettingMenuTile(
                      icon: Iconsax.safe_home,
                      onTap: () => Get.to(() => const UserAdressScreen()),
                      subTitle: 'set Delivery Address',
                      title: 'My Adresses'),
                  TSettingMenuTile(
                    onTap: () => Get.to(() => const CartScreen()),
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'add , remove product and move to chickout',
                  ),
                  const TSettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle:
                        'Pariatur eu ea quis nulla enim cillum sint reprehenderit deserunt qui pariatur enim.',
                  ),
                  TSettingMenuTile(
                    onTap: () {
                      final controller = Get.put(NavigationController());
                      controller.updateSelectedIndex(1);
                      Get.to(() => const FavoriteScreen());
                    },
                    icon: Iconsax.heart,
                    title: 'Wish List',
                    subTitle: 'Ea do nisi esse esse occaecat.',
                  ),
                  const TSettingMenuTile(
                    icon: Iconsax.component,
                    title: 'My Projects',
                    subTitle: 'track processing projects ',
                  ),
                  const TSettingMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Ea do nisi esse esse occaecat.',
                  ),
                  const TSettingMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notification',
                    subTitle: 'Do culpa reprehenderit ullamco fugiat.',
                  ),

                  const TSettingMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'manage data usage',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtWsections,
                  ),
                  const TSectionHeading(
                    title: 'App Setting',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtWItems,
                  ),

                  const TSettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'upload data to your account',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
