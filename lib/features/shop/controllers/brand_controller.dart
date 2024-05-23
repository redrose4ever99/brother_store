import 'package:brother_store/data/repositoies/Brand/brand_repository.dart';
import 'package:brother_store/data/repositoies/product/product_repository.dart';
import 'package:brother_store/features/shop/models/brand_model.dart';
import 'package:brother_store/features/shop/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();
  final isLoading = false.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featureBrands = <BrandModel>[].obs;

  @override
  void onInit() {
    fetchBrands();
    super.onInit();
  }

  Future<void> fetchBrands() async {
    try {
      isLoading.value = true;
      final brandsRepo = Get.put(BrandRepository());
      final brands = await brandsRepo.fetchBrands();
      allBrands.assignAll(brands);
      featureBrands
          .assignAll(allBrands.where((p0) => p0.isFeature ?? false).take(4));
      if (kDebugMode) {
        print('============ Brands length==========');
        print(brands.length);
      }
    } catch (e) {
      if (kDebugMode) {
        print("========exception============");
        print(e.toString());
      } // Get.snackbar('oh Snap!', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> getBrandProducts(String brandId) async {
    try {
      final products = await ProductRepository.instance
          .gstProductsForBrand(brandId: brandId);
      return products;
    } catch (e) {
      if (kDebugMode) {
        print("========exception============");
        print(e.toString());
      }
      return []; // Get.snackbar('oh Snap!', e.toString());
    }
  }
}
