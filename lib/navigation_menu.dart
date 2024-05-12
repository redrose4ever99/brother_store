import 'package:brother_store/features/shop/screens/gallery/gallery.dart';
import 'package:brother_store/features/shop/screens/store/store.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/personlization/screens/settings/settings.dart';
import 'features/shop/screens/home/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      //  floatingActionButton: const TCircularFabWidget(),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
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
                    Iconsax.heart,
                    color: TColors.primary,
                  ),
                  icon: const Icon(Iconsax.gallery),
                  label: AppLocalizations.of(context)!.gallery),
              // NavigationDestination(
              //     selectedIcon: Icon(
              //       Iconsax.user,
              //       color: TColors.primary,
              //     ),
              //     icon: Icon(Iconsax.heart),
              //     label: 'المفضلة'),
              NavigationDestination(
                  selectedIcon: const Icon(
                    Iconsax.user,
                    color: TColors.primary,
                  ),
                  icon: const Icon(Iconsax.user),
                  label: AppLocalizations.of(context)!.account),
            ]),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const TGalleryScreen(),
    //  const TGalleryScreen(),
    const SettingsScreen()
  ];
}
