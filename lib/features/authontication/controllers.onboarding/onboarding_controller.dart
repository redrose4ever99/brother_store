import 'package:brother_store/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
//Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
//update current index when page Scrolling
  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void nextPage() {
    Get.updateLocale(const Locale('en'));

    if (currentPageIndex.value == 2) {
      Get.to(const NavigationMenu());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage() {
    Get.to(const NavigationMenu());
  }
}
