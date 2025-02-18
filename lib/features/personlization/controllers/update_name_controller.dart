import 'package:brother_store/data/repositoies/user/user_repository.dart';
import 'package:brother_store/features/authontication/controllers/network_manager.dart';
import 'package:brother_store/features/personlization/controllers/user_controller.dart';
import 'package:brother_store/features/personlization/screens/profile/profile.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/loader/loaders.dart';
import 'package:brother_store/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  // Rx<UserModel> user = UserModel.empty().obs;
  // final profileLoading = false.obs;
  // final userRepository = Get.put(UserRepository());
  // final imageUploading = false.obs;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updateUseNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  Future<void> initializeName() async {
    firstName.text = userController.user.value.firstName ?? '';
    lastName.text = userController.user.value.lastName ?? '';
  }

  Future<void> updateUserName() async {
    try {
      TFullScreenLoader.openloadingDialog(
          AppLocalizations.of(Get.context!)!.weAreUpdating,
          TImages.proccessLottie);

      //check connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation

      if (!updateUseNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //update name

      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleFieldUser(name);
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      TFullScreenLoader.stopLoading();
      TLoader.successSnackBar(
          title: AppLocalizations.of(Get.context!)!.congratulation,
          message: AppLocalizations.of(Get.context!)!.nameChange);

      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.erroreSnackBar(title: 'oh snap', message: e.toString());
    }
  }
}
