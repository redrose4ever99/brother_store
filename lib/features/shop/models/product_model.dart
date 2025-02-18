import 'package:brother_store/features/shop/models/brand_model.dart';
import 'package:brother_store/features/shop/models/product_atribute_model.dart';
import 'package:brother_store/features/shop/models/product_variation_model.dart';
import 'package:brother_store/utils/logging/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  String arabicTitle;
  double salePrice;
  String thumbnail;
  bool? isFeature;
  BrandModel? brand;
  String? description;
  String? arabicDescription;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAtributeModel>? productAtributes;
  List<ProductVariationModel>? productVariations;

  ProductModel(
      {required this.id,
      required this.title,
      required this.arabicTitle,
      required this.price,
      required this.thumbnail,
      required this.productType,
      required this.stock,
      this.sku,
      this.brand,
      this.images,
      this.salePrice = 0.0,
      this.isFeature,
      this.description,
      this.arabicDescription,
      this.categoryId,
      this.productAtributes,
      this.productVariations});

  toJson() {
    return {
      'Id': id,
      'SKU': sku ?? '',
      'Title': title,
      'ArabicTitle': arabicTitle,
      'Thumbnail': thumbnail,
      'ProductType': productType,
      'IsFeature': isFeature,
      'Description': description ?? '',
      'ArabicDescription': arabicDescription ?? '',
      'Brand': brand!.toJson(),
      'Images': images ?? [],
      'Price': price,
      'SalePrice': salePrice,
      'CategoryId': categoryId,
      'Stock': stock,
      'ProductAtributes': productAtributes != null
          ? productAtributes!.map((e) => e.toJason()).toList()
          : [],
      'ProductVariations': productVariations != null
          ? productVariations!.map((e) => e.toJason()).toList()
          : [],
    };
  }

  static ProductModel empty() => ProductModel(
      id: '',
      title: '',
      arabicTitle: '',
      productType: '',
      thumbnail: '',
      stock: 0,
      price: 0);

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    TLoggerHelper.info(data['Title']);
    return ProductModel(
      id: data['Id'] ?? '',
      title: data['Title'],
      arabicTitle: data['ArabicTitle'],
      description: data['Description'],
      arabicDescription: data['ArabicDescription'],
      thumbnail: data['Thumbnail'] ?? '',
      productType: data['ProductType'] ?? '',
      sku: data['SKU'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      isFeature: data['IsFeature'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],

      stock: data['Stock'] ?? 0,
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      brand: BrandModel.fromJason(data['Brand']),
      // productAtributes: (data['ProductAttributs'] as List<dynamic>)
      //     .map((e) => ProductAtributeModel.fromJason(e))
      //     .toList(),
      // productVariations: (data['ProductVariations'] as List<dynamic>)
      //     .map((e) => ProductVariationModel.fromJason(e))
      //     .toList()
    );
  }

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data() as Map<String, dynamic>;
    if (kDebugMode) {
      print(data);
    }
    return ProductModel(
      id: document.id,
      title: data['Title'] ?? '',
      arabicTitle: data['ArabicTitle'] ?? '',
      description: data['Description'],
      arabicDescription: data['ArabicDescription'],
      thumbnail: data['Thumbnail'] ?? '',
      productType: data['ProductType'] ?? '',
      sku: data['SKU'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      isFeature: data['IsFeature'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      stock: data['Stock'] ?? 0,
      // salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      brand: BrandModel.fromJason(data['Brand']),
      // productAtributes: (data['ProductAttributs'] as List<dynamic>)
      //     .map((e) => ProductAtributeModel.fromJason(e))
      //     .toList(),
      // productVariations: (data['ProductVariations'] as List<dynamic>)
      //     .map((e) => ProductVariationModel.fromJason(e))
      //     .toList()
    );
  }
}
