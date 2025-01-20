import 'dart:convert';

import 'package:brother_store/data/repositoies/product/product_repository.dart';
import 'package:brother_store/features/shop/models/product_model.dart';
import 'package:brother_store/utils/loader/loaders.dart';
import 'package:brother_store/utils/storage/storage_utility.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();

// Variables
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
      if (kDebugMode) {
        print("==========favorite===========");
        print(storedFavorites);
      }

      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorites(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
      TLoader.successSnackBar(
        title: AppLocalizations.of(Get.context!)!.info,
        message:
            AppLocalizations.of(Get.context!)!.successfullyAddedToFavorites,
      );
    } else {
      TLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      TLoader.successSnackBar(
        title: AppLocalizations.of(Get.context!)!.info,
        message: AppLocalizations.of(Get.context!)!.productHasBeenRemoved,
      );
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    TLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoritesProducts() async {
    return await ProductRepository.instance
        .getFavoritesProducts(favorites.keys.toList());
  }
}
