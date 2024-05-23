import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class GalleryModel {
  String image;
  final String albumId;
  final bool isFeature;

  GalleryModel({
    required this.image,
    required this.albumId,
    required this.isFeature,
  });
  static GalleryModel empty() =>
      GalleryModel(albumId: '', image: '', isFeature: false);

  Map<String, dynamic> toJson() {
    return {'Image': image, 'Album': albumId, 'IsFeature': isFeature};
  }

  factory GalleryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    if (kDebugMode) {
      print(data);
    }
    return GalleryModel(
      image: data['Image'] ?? '',
      albumId: data['Album'] ?? '',
      isFeature: data['IsFeature'] ?? false,
    );
  }
}
