import 'dart:math';

import 'package:brother_store/app.dart';
import 'package:brother_store/data/repositoies/user/user_repository.dart';
import 'package:brother_store/features/authontication/screens/login/phone_verification.dart';
import 'package:brother_store/features/authontication/screens/onboarding/onboarding.dart';
import 'package:brother_store/features/personlization/models/users/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  var verificationId = ''.obs;

  late final Rx<User?> firebaseUser;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    super.onReady();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;

    // user.uid = 'EyTbtgIxRwamzlhsPnSs4lehlcc2';
    if (user != null) {
      if (kDebugMode) {
        print('=============================current user id=================');
        print('EyTbtgIxRwamzlhsPnSs4lehlcc2');
      }
    }
    if (kDebugMode) {
      print('=============================Get Storage=================');
      print(deviceStorage.read('isTheFirstTime'));
    }
    deviceStorage.writeIfNull('isTheFirstTime', true);
    deviceStorage.writeIfNull('en', true);

    deviceStorage.read('isTheFirstTime') != true
        ? Get.offAll(() => const App())
        : Get.offAll(() => const OnBoardingScreen());
  }

  ///Rigesteration
  Future<void> phoneAuthentication(String phoneNum) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNum,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
        if (kDebugMode) {
          print(credential.verificationId.toString());
        }
        Get.snackbar(
            snackPosition: SnackPosition.BOTTOM,
            'sussess',
            credential.verificationId.toString());
        Get.snackbar(
            snackPosition: SnackPosition.BOTTOM,
            'sussess',
            'complite verification please');
        Get.to(const PhoneVerificationScreen());
      },
      codeSent: (verificationId, resendingToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        // throw e;
        if (kDebugMode) {
          print(e.message.toString());
        }
        if (e.code == 'invalid_phone_number') {
          Get.snackbar(
            snackPosition: SnackPosition.BOTTOM,
            'Error',
            'the provided phone number is not valid.',
          );
        } else {
          Get.snackbar('Error', e.message.toString());
          if (kDebugMode) {
            print(e.message.toString());
          }
        }
      },
    );
  }

  Future<bool> verifyOtp(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    if (credentials.user != null) {
      String uid = credentials.user!.uid;
      final user =
          UserModel(id: uid, phoneNumber: credentials.user!.phoneNumber);
      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(user);
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          "sussess",
          "your Account created sussessfully");
    }

    return credentials.user != null ? true : false;
  }
}
