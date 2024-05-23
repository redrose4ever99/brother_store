import 'package:brother_store/data/repositoies/product/product_repository.dart';
import 'package:brother_store/features/shop/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  //Variables
  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  final RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  @override
  void onInit() {
    fetchFeatureProducts();
    super.onInit();
  }

  void fetchFeatureProducts() async {
    try {
      isLoading.value = true;
      final products = await productRepository.getFeaturesProducts();
      featuredProducts.assignAll(products);
      if (kDebugMode) {
        print('============ product length==========');
        print(featuredProducts.length);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeatureProducts() async {
    try {
      final products = await productRepository.getAllFeaturesProducts();

      if (kDebugMode) {
        print('============ product length==========');
        print(featuredProducts.length);
      }
      return products;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }

  String getProductPrice(ProductModel product) {
    return " ${product.salePrice > 0 ? product.salePrice : product.price}";
  }

  String? calculateSalePresentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0 || originalPrice <= 0.0) {
      return null;
    }
    double precentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return precentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
