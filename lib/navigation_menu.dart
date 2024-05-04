import 'package:brother_store/features/shop/screens/gallery/gallery.dart';
import 'package:brother_store/features/shop/screens/store/store.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/shop/screens/home/home.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
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
            destinations: const [
              NavigationDestination(
                selectedIcon: Icon(
                  Iconsax.home,
                  color: TColors.primary,
                ),
                icon: Icon(
                  Iconsax.home,
                ),
                label: 'الرئيسية',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Iconsax.shop,
                  color: TColors.primary,
                ),
                icon: Icon(
                  Iconsax.shop,
                ),
                label: 'المتجر',
              ),
              NavigationDestination(
                  selectedIcon: Icon(
                    Iconsax.heart,
                    color: TColors.primary,
                  ),
                  icon: Icon(Iconsax.gallery),
                  label: 'المعرض'),
              NavigationDestination(
                  selectedIcon: Icon(
                    Iconsax.user,
                    color: TColors.primary,
                  ),
                  icon: Icon(Iconsax.user),
                  label: 'حسابي'),
            ]),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const TGalleryScreen(),
    Container(color: Colors.green)
  ];
}
