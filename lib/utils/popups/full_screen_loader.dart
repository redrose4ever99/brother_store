import 'package:brother_store/common/widgets/loaders/animation_loading.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFullScreenLoader {
  static void openloadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => Container(
        color: THelperFunctions.isDarkMode(Get.context!)
            ? TColors.dark
            : TColors.light,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 250,
            ),
            TAnimationLoaderWidget(text: text, animation: animation)
          ],
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
