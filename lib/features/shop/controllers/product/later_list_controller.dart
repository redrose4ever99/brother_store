import 'dart:convert';

import 'package:brother_store/data/repositoies/product/product_repository.dart';
import 'package:brother_store/features/shop/models/product_model.dart';
import 'package:brother_store/utils/storage/storage_utility.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LaterListController extends GetxController {
  static LaterListController get instance => Get.find();

// Variables
  final laterList = <String, bool>{}.obs;
  @override
  void onInit() {
    initLaterList();
    super.onInit();
  }

  Future<void> initLaterList() async {
    final json = TLocalStorage.instance().readData('laterlist');
    if (json != null) {
      final storedLaterList = jsonDecode(json) as Map<String, dynamic>;
      if (kDebugMode) {
        print("==========laterlist===========");
        print(storedLaterList);
      }

      laterList.assignAll(
          storedLaterList.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isLaterShoping(String productId) {
    return laterList[productId] ?? false;
  }

  void toggleLaterShopingProduct(String productId) {
    if (!laterList.containsKey(productId)) {
      laterList[productId] = true;
      saveLaterShopToStorage();
    } else {
      TLocalStorage.instance().removeData(productId);
      laterList.remove(productId);
      saveLaterShopToStorage();
      laterList.refresh();
    }
  }

  void saveLaterShopToStorage() {
    final encodedLatershop = json.encode(laterList);
    TLocalStorage.instance().saveData('laterlist', encodedLatershop);
  }

  Future<List<ProductModel>> laterListProducts() async {
    return await ProductRepository.instance
        .getAllProductsByIds(laterList.keys.toList());
  }
}
