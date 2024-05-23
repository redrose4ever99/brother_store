import 'package:brother_store/app.dart';
import 'package:brother_store/utils/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('=======lang===========');
      print(Get.locale?.languageCode);
    }

    //Get.updateLocale(const Locale('en'));
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Brothers Store',
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        // localizationsDelegates: const [
        //   AppLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // supportedLocales: const [
        //   Locale('en'), // English
        //   Locale('ar'), // Spanish
        // ],
        // textDirection: Get.locale?.languageCode == 'en'
        //     ? TextDirection.ltr
        //     : TextDirection.rtl,
        home: const App()

        // Scaffold(
        //   backgroundColor: TColors.primary,
        //   body: Center(
        //     child: CircularProgressIndicator(
        //       color: Colors.white,
        //     ),
        //   ),
        // ),

        );
  }
}
