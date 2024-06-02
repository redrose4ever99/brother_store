import 'package:brother_store/data/repositoies/user/user_repository.dart';
import 'package:brother_store/features/personlization/models/users/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;
  final userRepository = Get.put(UserRepository());
  final imageUploading = false.obs;
  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

//   Future<void> saveUserRecord(UserCredential? userCredential) async {
//     try {

//       if(userCredential!=null){
// final nameParts=UserModel.n
//       }
//     } catch (e) {
//       Get.snackbar('error', e.toString());
//     }
//   }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      this.user.value = user;
    } catch (e) {
      user(UserModel.empty());
      Get.snackbar('error', e.toString());
    } finally {
      profileLoading.value = false;
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile', image);
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleFieldUser(json);
        user.value.profilePicture = imageUrl;
        user.refresh();
        Get.snackbar('Success', "profile photo change successfully",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("ohSnap", "Something went wrong!",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      imageUploading.value = false;
    }
  }
}
