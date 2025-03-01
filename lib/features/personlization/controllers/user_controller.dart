import 'package:brother_store/data/repositoies/authentication/authentication_repository.dart';
import 'package:brother_store/data/repositoies/user/user_repository.dart';
import 'package:brother_store/features/authontication/controllers/network_manager.dart';
import 'package:brother_store/features/authontication/screens/authenticate/re_authenticate.dart';
import 'package:brother_store/features/authontication/screens/login/login.dart';
import 'package:brother_store/features/personlization/models/users/user_model.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/loader/loaders.dart';
import 'package:brother_store/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;
  final hidePassword = true.obs;
  final userRepository = Get.put(UserRepository());
  final imageUploading = false.obs;

  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();

  GlobalKey<FormState> reauthenticateFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      this.user.value = user;
    } catch (e) {
      user(UserModel.empty());
      TLoader.erroreSnackBar(title: 'oh Snap!', message: e.toString());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredentials.user!.displayName ?? '');
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts[1],
          userName: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoader.warningSnackBar(
          title: 'Data not Saved',
          message:
              'Something went wrong while save your information , please try again');
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

        // TLoader.successSnackBar(
        //     title: 'Success', message: 'profile photo change successfully');
      }
    } catch (e) {
      TLoader.erroreSnackBar(title: 'ohSnap', message: 'Something went wrong!');
    } finally {
      imageUploading.value = false;
    }
  }

  uploadProjectFile() async {
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

        // TLoader.successSnackBar(
        //   title: 'Success', message: 'profile photo change successfully');
      }
    } catch (e) {
      TLoader.erroreSnackBar(title: 'ohSnap', message: 'Something went wrong!');
    } finally {
      imageUploading.value = false;
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: AppLocalizations.of(Get.context!)!.deleteAccount,
        middleText: AppLocalizations.of(Get.context!)!.deleteAccountWarning,
        confirm: ElevatedButton(
          onPressed: () => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: TSizes.lg,
            ),
            child: Text(AppLocalizations.of(Get.context!)!.delete),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: Text(AppLocalizations.of(Get.context!)!.cancel)));
  }

  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openloadingDialog(
          AppLocalizations.of(Get.context!)!.processing,
          TImages.proccessLottie);
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();

          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();

          Get.to(() => const ReAuthenticateScreen());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.warningSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPassword() async {
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
      if (!reauthenticateFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.warningSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
