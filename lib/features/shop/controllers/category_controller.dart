import 'package:brother_store/data/repositoies/categories/category_repository.dart';
import 'package:brother_store/features/authontication/controllers/network_manager.dart';
import 'package:brother_store/features/shop/models/category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featureCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchAllCategories();
    super.onInit();
  }

  Future<void> fetchAllCategories() async {
    Get.put(NetworkManager());
    try {
      isLoading.value = true;
      final isConnected = NetworkManager.instance.isConnected();
      if (await isConnected) {
        if (kDebugMode) {
          print('connection internet is good');
        }
      } else {
        if (kDebugMode) {
          print("===========no internet=========");
        }
      }

      final categories = await _categoryRepository.getAllCategories();
      allCategories.assignAll(categories);
      featureCategories.assignAll(allCategories
          .where((cat) => cat.isFeature && cat.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      } // Get.snackbar('oh Snap!', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}