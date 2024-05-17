import 'package:brother_store/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
    // Get.updateLocale(const Locale('en'));
// deviceStorage.writeIfNull('isTheFirstTime', true);
    if (currentPageIndex.value == 2) {
      GetStorage().write('isTheFirstTime', false);

      Get.to(const App());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage() {
    GetStorage().write('isTheFirstTime', false);
    Get.to(const App());
  }
}
