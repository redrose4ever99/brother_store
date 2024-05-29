import 'dart:convert';

import 'package:brother_store/data/repositoies/product/product_repository.dart';
import 'package:brother_store/features/shop/models/product_model.dart';
import 'package:brother_store/utils/storage/storage_utility.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();

  //Variables

  // final repository = ProductRepository.instance;
  // final RxString selectedSortOption = 'Name'.obs;
  // final RxList<ProductModel> products = <ProductModel>[].obs;
  final favorites = <String, bool>{}.obs;
  @override
  void onInit() {
    initFavorites();
    super.onInit();
  }

  Future<void> initFavorites() async {
    final json = TLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorites(String product_id) {
    return favorites[product_id] ?? false;
  }

  void toggleFavoriteProduct(String product_id) {
    if (!favorites.containsKey(product_id)) {
      favorites[product_id] = true;
      saveFavoritesToStorage();
      Get.snackbar(
        'info',
        'successfully added to Favorites',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      TLocalStorage.instance().readData(product_id);
      favorites.remove(product_id);
      saveFavoritesToStorage();
      favorites.refresh();
      Get.snackbar(
        'info',
        'successfully removed frome Favorites',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    TLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  // Future<List<ProductModel>> favoritesProducts() async {
  //   return await ProductRepository.instance
  //       .getFavoritesProducts(favorites.keys.toList());
  // }
}
