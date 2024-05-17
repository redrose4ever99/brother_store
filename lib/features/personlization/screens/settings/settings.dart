import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:brother_store/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:brother_store/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/features/authontication/screens/login/signup.dart';
import 'package:brother_store/features/personlization/screens/settings/language/language.dart';
import 'package:brother_store/features/project/screens/projects/projects.dart';
import 'package:brother_store/features/shop/screens/cart/cart.dart';
import 'package:brother_store/features/shop/screens/orders/widgets/order.dart';
import 'package:brother_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:brother_store/navigation_menu.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:brother_store/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../address/address.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TPrimaryHeaderContainer(
                  child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      AppLocalizations.of(context)!.account,
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
                    TSectionHeading(
                        title: AppLocalizations.of(context)!.accountSettings,
                        showActionButton: false),
                    const SizedBox(
                      height: TSizes.spaceBtWItems,
                    ),
                    TSettingMenuTile(
                        icon: Iconsax.safe_home,
                        onTap: () => Get.to(() => const UserAdressScreen()),
                        subTitle: 'set Delivery Address',
                        title: AppLocalizations.of(context)!.myAddresses),
                    TSettingMenuTile(
                      onTap: () => Get.to(() => const CartScreen()),
                      icon: Iconsax.shopping_cart,
                      title: AppLocalizations.of(context)!.myCart,
                      subTitle: 'add , remove product and move to chickout',
                    ),
                    TSettingMenuTile(
                      onTap: () => Get.to(() => const OrderScreen()),
                      icon: Iconsax.bag_tick,
                      title: AppLocalizations.of(context)!.myOrders,
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
                      title: AppLocalizations.of(context)!.wishList,
                      subTitle: 'Ea do nisi esse esse occaecat.',
                    ),
                    TSettingMenuTile(
                      onTap: () => Get.to(() => const ProjectsScreen()),
                      icon: Iconsax.component,
                      title: AppLocalizations.of(context)!.myProjects,
                      subTitle: 'track processing projects ',
                    ),
                    // ),
                    TSettingMenuTile(
                      onTap: () => Get.to(() => const SignupScreen()),
                      icon: Iconsax.notification,
                      title: AppLocalizations.of(context)!.notifications,
                      subTitle: 'Do culpa reprehenderit ullamco fugiat.',
                    ),

                    TSettingMenuTile(
                      icon: Iconsax.security_card,
                      title: AppLocalizations.of(context)!.accountPrivacy,
                      subTitle: 'manage data usage',
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtWsections,
                    ),
                    TSectionHeading(
                      title: AppLocalizations.of(context)!.appSettings,
                      showActionButton: false,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtWItems,
                    ),

                    TSettingMenuTile(
                      icon: Iconsax.document_upload,
                      title: AppLocalizations.of(context)!.loadDate,
                      subTitle: 'upload data to your account',
                    ),
                    TSettingMenuTile(
                      onTap: () => Get.to(() => const LanguageScreen()),
                      icon: Icons.language,
                      title: AppLocalizations.of(context)!.languageSetting,
                      subTitle: 'choose your language',
                    ),
                    TSettingMenuTile(
                      icon: Iconsax.moon5,
                      title: AppLocalizations.of(context)!.darkMode,
                      subTitle: 'choose your Brightness',
                      trailing: Switch(
                          activeColor: TColors.primary,
                          value: THelperFunctions.isDarkMode(context),
                          onChanged: (value) {
                            if (value) {
                              Get.changeTheme(TAppTheme.darkTheme);
                            } else {
                              Get.changeTheme(TAppTheme.lightTheme);
                            }
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
