import 'dart:ui';

import 'package:brother_store/data/repositoies/brothers/brothers_repository.dart';
import 'package:brother_store/features/general/models/brother_model.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/loader/loaders.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:string_to_color/string_to_color.dart';

class BrothersController extends GetxController {
  static BrothersController get instance => Get.find();
  final isLoading = false.obs;
  RxString? primaryColor = "Color(0xff0099ff)".obs;
  Color color = TColors.primary;
  final _brothersRepository = Get.put(BrotherRepository());
  RxList<BrotherModel> allData = <BrotherModel>[].obs;

  @override
  void onInit() {
    fetchAllData();
    super.onInit();
  }

  Future<void> fetchAllData() async {
    try {
      isLoading.value = true;

      final data = await _brothersRepository.getAlldata();
      allData.assignAll(data);
      primaryColor?.value = allData[0].primaryColor!;
      // color = ColorUtils.stringToColor(primaryColor.toString());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      TLoader.erroreSnackBar(title: 'oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
