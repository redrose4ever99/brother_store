import 'package:brother_store/features/gallery/models/gallery_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class GalleryRepository extends GetxController {
  static GalleryRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<GalleryModel>> fetchgalleryPhoto() async {
    try {
      final result = await _db
          .collection('Gallery')
          .where('IsFeature', isEqualTo: true)
          .get();

      return result.docs
          .map(
              (documentSnapshot) => GalleryModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw e.code;
    }
  }
}
