import 'package:brother_store/app.dart';
import 'package:brother_store/features/authontication/screens/onboarding/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  var verificationId = ''.obs;
  late final Rx<User?> firebaseUser;
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    super.onReady();
  }

  void screenRedirect() async {
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
        },
        verificationFailed: (e) {
          if (e.code == 'inval') {
            Get.snackbar('Error', 'the provided phone number is not valid.');
          } else {
            Get.snackbar('Error', 'Something went wrong please try again');
          }
        },
        codeSent: (verificationId, resendingToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        });
  }

  Future<bool> verifyOtp(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));

    return credentials.user != null ? true : false;
  }
}
