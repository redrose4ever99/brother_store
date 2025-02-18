import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:brother_store/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:brother_store/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/data/repositoies/authentication/authentication_repository.dart';
import 'package:brother_store/features/personlization/screens/settings/language/language.dart';
import 'package:brother_store/features/project/screens/prices/prices.dart';
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
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../address/address.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final termController = BrothersController.instance;
    // final brotherData = termController.allData;
    // bool isEg = Get.locale?.languageCode == 'en';
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
                        icon: Iconsax.location,
                        onTap: () => Get.to(() => const UserAdressScreen()),
                        subTitle: AppLocalizations.of(context)!.addressSubtile,
                        title: AppLocalizations.of(context)!.myAddresses),
                    TSettingMenuTile(
                      onTap: () => Get.to(() => const CartScreen()),
                      icon: Iconsax.shopping_bag,
                      title: AppLocalizations.of(context)!.myCart,
                      subTitle: AppLocalizations.of(context)!.cartSubtitle,
                    ),
                    TSettingMenuTile(
                      onTap: () => Get.to(() => const OrderScreen()),
                      icon: Iconsax.printer,
                      title: AppLocalizations.of(context)!.myOrders,
                      subTitle: AppLocalizations.of(context)!.ordersSubtitle,
                    ),
                    TSettingMenuTile(
                        onTap: () {
                          final controller = Get.put(NavigationController());
                          controller.updateSelectedIndex(1);
                          Get.to(() => const FavoriteScreen());
                        },
                        icon: Iconsax.heart,
                        title: AppLocalizations.of(context)!.wishList,
                        subTitle:
                            AppLocalizations.of(context)!.wishlistSubTitle),
                    TSettingMenuTile(
                      onTap: () => Get.to(() => const ProjectsScreen()),
                      icon: Iconsax.buildings_2,
                      title: AppLocalizations.of(context)!.myProjects,
                      subTitle: 'track processing projects ',
                    ),

                    TSettingMenuTile(
                        onTap: () => Get.to(() => const TPricesRequestScreen()),
                        icon: Iconsax.discount_shape,
                        title: AppLocalizations.of(context)!.priceRequest,
                        subTitle:
                            'you can Request for Price or decoration price'),
                    //  ),
                    // TSettingMenuTile(
                    //   onTap: () => Get.to(() => const NotificationScreen()),
                    //   icon: Iconsax.notification,
                    //   title: AppLocalizations.of(context)!.notifications,
                    //   subTitle: 'Do culpa reprehenderit ullamco fugiat.',
                    // ),

                    // TSettingMenuTile(
                    //   icon: Iconsax.security_card,
                    //   title: AppLocalizations.of(context)!.accountPrivacy,
                    //   subTitle: 'manage data usage',
                    // ),
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

                    // TSettingMenuTile(
                    //   icon: Iconsax.document_upload,
                    //   title: AppLocalizations.of(context)!.loadDate,
                    //   subTitle: 'upload data to your account',
                    // ),

                    TSettingMenuTile(
                      onTap: () {
                        if (Get.locale?.languageCode == 'ar') {
                          GetStorage().write('en', true);
                          Get.updateLocale(const Locale('en'));
                        } else {
                          GetStorage().write('en', false);
                          Get.updateLocale(const Locale('ar'));
                        }

                        Get.reload();
                      },
                      icon: Icons.language,
                      title: AppLocalizations.of(context)!.changedTo,
                      subTitle:
                          AppLocalizations.of(context)!.chooseYourLanguage,
                    ),
                    TSettingMenuTile(
                      icon: Iconsax.moon5,
                      title: AppLocalizations.of(context)!.darkMode,
                      subTitle:
                          AppLocalizations.of(context)!.chooseYourPrightness,
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
                    TSettingMenuTile(
                      onTap: () => AuthenticationRepository.instance.logOut(),
                      icon: Icons.logout,
                      title: AppLocalizations.of(context)!.logout,
                      subTitle: AppLocalizations.of(context)!.logout,
                    ),

                    // const Divider(),
                    // TSettingMenuTile(
                    //   onTap: () => Get.to(() => TermsScreen(
                    //         data: isEg
                    //             ? brotherData[0].termsCondition
                    //             : brotherData[0].arabicTermsCondition,
                    //         title: AppLocalizations.of(context)!.termsCondition,
                    //       )),
                    //   icon: Icons.terminal,
                    //   title: AppLocalizations.of(context)!.termsCondition,
                    //   subTitle: AppLocalizations.of(context)!.termsCondition,
                    // ),
                    // TSettingMenuTile(
                    //   onTap: () => Get.to(() => TermsScreen(
                    //         data: isEg
                    //             ? brotherData[0].privacyPolicy
                    //             : brotherData[0].arabicPrivacyPolicy,
                    //         title: AppLocalizations.of(context)!.privacyPolicy,
                    //       )),
                    //   icon: Icons.security,
                    //   title: AppLocalizations.of(context)!.privacyPolicy,
                    //   subTitle: AppLocalizations.of(context)!.privacyPolicy,
                    // ),
                    // TSettingMenuTile(
                    //   onTap: () => Get.to(() => TermsScreen(
                    //         data: isEg
                    //             ? brotherData[0].returnPolicy
                    //             : brotherData[0].arabicReturnPolicy,
                    //         title: AppLocalizations.of(context)!.returnPolicy,
                    //       )),
                    //   icon: Icons.all_inclusive,
                    //   title: AppLocalizations.of(context)!.returnPolicy,
                    //   subTitle: AppLocalizations.of(context)!.returnPolicy,
                    // ),
                    // TSettingMenuTile(
                    //   onTap: () => Get.to(() => TermsScreen(
                    //         data: isEg
                    //             ? brotherData[0].cancellationPolicy
                    //             : brotherData[0].arabicCancellationPolicy,
                    //         title: AppLocalizations.of(context)!.cancelPolicy,
                    //       )),
                    //   icon: Icons.cancel_schedule_send_rounded,
                    //   title: AppLocalizations.of(context)!.cancelPolicy,
                    //   subTitle: AppLocalizations.of(context)!.cancelPolicy,
                    // ),
                    // TSettingMenuTile(
                    //   onTap: () => Get.to(() => TermsScreen(
                    //         data: isEg
                    //             ? brotherData[0].aboutUs ?? ""
                    //             : brotherData[0].arabicAboutUs ?? '',
                    //         title: AppLocalizations.of(context)!.aboutUs,
                    //       )),
                    //   icon: Icons.info_outlined,
                    //   title: AppLocalizations.of(context)!.aboutUs,
                    //   subTitle: AppLocalizations.of(context)!.aboutUs,
                    // ),
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
