import 'package:brother_store/features/gallery/screen/gallery.dart';
import 'package:brother_store/features/shop/screens/store/store.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/personlization/screens/settings/settings.dart';
import 'features/shop/screens/cart/cart.dart';
import 'features/shop/screens/home/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key, this.isGust});
  final bool? isGust;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        //  floatingActionButton: const TCircularFabWidget(),
        body: WillPopScope(
            onWillPop: showExitDialog,
            child:
                Obx(() => controller.screens[controller.selectedIndex.value])),
        bottomNavigationBar: Obx(
          () => NavigationBar(
              elevation: 0,
              height: 80,
              backgroundColor: darkMode ? TColors.black : TColors.white,
              indicatorColor: darkMode
                  ? TColors.white.withOpacity(0.1)
                  : TColors.black.withOpacity(0.1),
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) =>
                  controller.selectedIndex.value = index,
              destinations: [
                NavigationDestination(
                  selectedIcon: const Icon(
                    Iconsax.home,
                    color: TColors.primary,
                  ),
                  icon: const Icon(
                    Iconsax.home,
                  ),
                  label: AppLocalizations.of(context)!.mainpage,
                ),
                NavigationDestination(
                  selectedIcon: const Icon(
                    Iconsax.shop,
                    color: TColors.primary,
                  ),
                  icon: const Icon(
                    Iconsax.shop,
                  ),
                  label: AppLocalizations.of(context)!.store,
                ),
                NavigationDestination(
                    selectedIcon: const Icon(
                      Iconsax.gallery,
                      color: TColors.primary,
                    ),
                    icon: const Icon(Iconsax.gallery),
                    label: AppLocalizations.of(context)!.gallery),
                NavigationDestination(
                    selectedIcon: const Icon(
                      Iconsax.shopping_bag,
                      color: TColors.primary,
                    ),
                    icon: const Icon(Iconsax.shopping_bag),
                    label: AppLocalizations.of(context)!.myCart),
                const NavigationDestination(
                    selectedIcon: Icon(
                      Iconsax.menu,
                      color: TColors.primary,
                    ),
                    icon: Icon(Iconsax.menu),
                    label: 'more'),
              ]),
        ),
      ),
    );
  }

  Future<bool> showExitDialog() async {
    if (NavigationController.instance.selectedIndex.value != 0) {
      NavigationController.instance.selectedIndex.value = 0;
      return false;
    } else {
      return await showDialog(
          context: Get.context!,
          builder: (context) => AlertDialog(
                title: Text(
                  AppLocalizations.of(context)!.exitApp,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                content: Text(AppLocalizations.of(context)!.doYouWantToExit,
                    style: Theme.of(context).textTheme.bodyMedium),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        AppLocalizations.of(context)!.no,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: TColors.white),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.yes,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: TColors.white),
                      ))
                ],
              ));
    }
  }
}

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  final Rx<int> selectedIndex = 0.obs;

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const TGalleryScreen(),
    const CartScreen(),
    const SettingsScreen()
  ];
}
