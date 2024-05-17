import 'package:brother_store/navigation_menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (Get.locale?.languageCode == null) {
      Get.updateLocale(const Locale('en'));
    }
    if (!GetStorage().read('en')) {
      Get.updateLocale(const Locale('ar'));
    }

    if (kDebugMode) {
      print('=======lang=============');
      print(Get.locale?.languageCode);
    }
    return
        // ZoomDrawer(
        //     isRtl: AppLocalizations.of(context)!.language != 'English',

        //     controller: ZoomDrawerController(),
        //     angle: 0,
        //     borderRadius: 20,
        //     showShadow: false,
        //     openCurve: Curves.fastOutSlowIn,
        //     slideWidth: THelperFunctions.screenwidth() * 0.7,
        //     style: DrawerStyle.style1,
        //     menuScreen: const MenuScreen(),
        //     mainScreen: const

        Localizations.override(
            context: context,
            locale: Locale(Get.locale?.languageCode ?? 'en'),
            child: const NavigationMenu());
  }
}
