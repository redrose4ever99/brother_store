import 'dart:io';

import 'package:brother_store/app.dart';
import 'package:brother_store/data/repositoies/user/user_repository.dart';
import 'package:brother_store/features/authontication/screens/login/login.dart';
import 'package:brother_store/features/authontication/screens/login/phone_verification.dart';
import 'package:brother_store/features/authontication/screens/onboarding/onboarding.dart';
import 'package:brother_store/features/authontication/screens/register/verify_email.dart';
import 'package:brother_store/features/personlization/models/users/user_model.dart';
import 'package:brother_store/utils/loader/loaders.dart';
import 'package:brother_store/utils/storage/storage_utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  final isGust = true.obs;
  var verificationId = ''.obs;

  late final Rx<User?> firebaseUser;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    //super.onReady();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        isGust.value = false;
        await TLocalStorage.init(_auth.currentUser!.uid);
        Get.offAll(() => const App());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      //await TLocalStorage.init('EyTbtgIxRwamzlhsPnSs4lehlcc2');
      // user.uid = 'EyTbtgIxRwamzlhsPnSs4lehlcc2';
      await TLocalStorage.init('gust');
      isGust.value = true;
      deviceStorage.writeIfNull('isTheFirstTime', true);
      deviceStorage.writeIfNull('en', true);
      deviceStorage.read('isTheFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  ///Rigesteration

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      var authUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      isGust.value = false;
      return authUser;
    } on FirebaseAuthException catch (e) {
      throw (e.code).toString();
    } on FirebaseException catch (e) {
      throw (e.code).toString();
    } on FormatException catch (_) {
      throw 'error formate';
    } on Platform catch (e) {
      throw e.toString();
    } catch (e) {
      throw 'Something wrong';
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw (e.code).toString();
    } on FirebaseException catch (e) {
      throw (e.code).toString();
    } on FormatException catch (_) {
      throw 'error formate';
    } on Platform catch (e) {
      throw e.toString();
    } catch (e) {
      throw 'Something wrong';
    }
  }

  Future<void> phoneAuthentication(String phoneNum) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNum,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
        if (kDebugMode) {
          print(credential.verificationId.toString());
        }
        // TLoader.successSnackBar(
        //     title: 'sussess', message: credential.verificationId.toString());
        TLoader.successSnackBar(
            title: 'sussess', message: 'complite verification please');
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
          TLoader.erroreSnackBar(
            title: 'Error',
            message: 'the provided phone number is not valid.',
          );
        } else {
          TLoader.erroreSnackBar(title: 'Error', message: e.message.toString());
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
      //   TLoader.successSnackBar(
      //       title: "sussess", message: "your Account created sussessfully");
    }

    return credentials.user != null ? true : false;
  }

  Future<void> logOut() async {
    try {
      await GoogleSignIn().currentUser?.clearAuthCache();
      await GoogleSignIn().disconnect();
      await FirebaseAuth.instance.signOut();
      Get.offAll(const LoginScreen());
      // Navigator.pushAndRemoveUntil(
      //     Get.context!, GetPageRoute(), (route) => false);
      // var user = FirebaseAuth.instance.currentUser;
    } on FirebaseAuthException catch (e) {
      throw (e.code).toString();
    } on FirebaseException catch (e) {
      throw (e.code).toString();
    } on FormatException catch (_) {
      throw 'error formate';
    } on Platform catch (e) {
      throw e.toString();
    } catch (e) {
      throw 'Something wrong';
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw (e.code).toString();
    } on FirebaseException catch (e) {
      throw (e.code).toString();
    } on FormatException catch (_) {
      throw 'error formate';
    } on Platform catch (e) {
      throw e.toString();
    } catch (e) {
      throw 'Something wrong';
    }
  }

  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw (e.code).toString();
    } on FirebaseException catch (e) {
      throw (e.code).toString();
    } on FormatException catch (_) {
      throw 'error formate';
    } on Platform catch (e) {
      throw e.toString();
    } catch (e) {
      throw 'Something wrong';
    }
  }

  Future<UserCredential?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw (e.code).toString();
    } on FirebaseException catch (e) {
      throw (e.code).toString();
    } on FormatException catch (_) {
      throw 'error formate';
    } on Platform catch (e) {
      throw e.toString();
    } catch (e) {
      throw 'Something wrong';
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      if (kDebugMode) {
        print("step 1 google auth");
      }
      // Obtain the auth details from the request.
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      // Create a new credential.

      if (kDebugMode) {
        print("step 2 google auth");
      }
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      if (kDebugMode) {
        print("step 3 google auth");
      }
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw (e.code).toString();
    } on FirebaseException catch (e) {
      throw (e.code).toString();
    } on FormatException catch (_) {
      throw 'error formate';
    } on Platform catch (e) {
      throw e.toString();
    } catch (e) {
      return null;
      //throw 'Something wrong';
    }
  }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw (e.code).toString();
    } on FirebaseException catch (e) {
      throw (e.code).toString();
    } on FormatException catch (_) {
      throw 'error formate';
    } on Platform catch (e) {
      throw e.toString();
    } catch (e) {
      throw 'Something wrong';
    }
  }
}
