// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;

  CartItemModel({
    required this.productId,
    required this.quantity,
    this.title = '',
    this.price = 0.0,
    this.image,
    this.variationId = '',
    this.brandName,
    this.selectedVariation,
  });

  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  Map<String, dynamic> toJason() {
    return {
      'title': title,
      'productId': productId,
      'image': image,
      'brandName': brandName,
      'selectedVariation': selectedVariation,
      'price': price,
      'variationId': variationId,
      'quantity': quantity
    };
  }

  factory CartItemModel.fromJason(Map<String, dynamic> json) {
    return CartItemModel(
        productId: json['productId'],
        quantity: json['quantity'],
        title: json['title'],
        price: json['price'],
        image: json['image'],
        variationId: json['variationId'],
        brandName: json['brandName'],
        selectedVariation: json['selectedVariation'] != null
            ? Map<String, String>.from(json['selectedVariation'])
            : null);
  }
}
