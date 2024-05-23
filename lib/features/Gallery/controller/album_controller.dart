import 'package:brother_store/data/repositoies/album/album_repository.dart';
import 'package:brother_store/features/Gallery/models/album_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AlbumController extends GetxController {
  static AlbumController get instance => Get.find();

  final isLoading = false.obs;
  final _albumRepository = Get.put(AlbumRepository());
  RxList<AlbumModel> allalbums = <AlbumModel>[].obs;

  @override
  void onInit() {
    fetchAllalbums();
    super.onInit();
  }

  Future<void> fetchAllalbums() async {
    try {
      final albums = await _albumRepository.getAllAlbums();
      allalbums.assignAll(albums);
      // featureCategories.assignAll(allCategories
      //     .where((cat) => cat.isFeature && cat.parentId.isEmpty)
      //     .take(8)
      //     .toList());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      } // Get.snackbar('oh Snap!', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
