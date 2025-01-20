import 'package:brother_store/data/repositoies/authentication/authentication_repository.dart';
import 'package:brother_store/features/authontication/controllers/network_manager.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/loader/loaders.dart';
import 'package:brother_store/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final privacyPolicy = true.obs;
  final localStorage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> LoginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    // password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> emailAndPasswordSignin() async {
    try {
      TFullScreenLoader.openloadingDialog(
          AppLocalizations.of(Get.context!)!.processing,
          TImages.proccessLottie);

      // check the internet connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!LoginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
      //TFullScreenLoader.stopLoading();
    } catch (e) {
      TLoader.erroreSnackBar(title: 'Ohh snap', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
