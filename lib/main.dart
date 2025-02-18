import 'package:brother_store/api/frebase_api.dart';
import 'package:brother_store/firebase_options.dart';
import 'package:brother_store/main_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'data/repositoies/authentication/authentication_repository.dart';
import 'utils/devices/device_utility.dart';

void main() async {
  await GetStorage.init();
  if (kDebugMode) {
    print('=========get storage ========');
    print(GetStorage().read('en'));
  }
  GetStorage().writeIfNull('en', true);
  if (Get.locale?.languageCode == null && GetStorage().read('en')) {
    Get.updateLocale(const Locale('en'));
  } else {
    Get.updateLocale(const Locale('ar'));
  }

  final WidgetsBinding widgetsFlutterBinding =
      WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsFlutterBinding);

  TDeviceUtils.isAndroid()
      ? await Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform)
          .then((FirebaseApp value) => Get.put(AuthenticationRepository()))
      : await Firebase.initializeApp()
          .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  Get.put(FirebaseApiController());
  runApp(const MainApp());
}
