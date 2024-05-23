// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class BannerModel {
  String image;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.image,
    required this.targetScreen,
    required this.active,
  });
  static BannerModel empty() =>
      BannerModel(targetScreen: '', image: '', active: false);

  Map<String, dynamic> toJson() {
    return {'Image': image, 'TargetScreen': targetScreen, 'Active': active};
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    if (kDebugMode) {
      print(data);
    }
    return BannerModel(
      image: data['Image'] ?? '',
      targetScreen: data['TargetScreen'] ?? '',
      active: data['Active'] ?? false,
    );
  }
}
