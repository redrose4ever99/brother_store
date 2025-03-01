import 'package:brother_store/bindings/general_binding.dart';
import 'package:brother_store/routes/app_routes.dart';
import 'package:brother_store/utils/theme/theme.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'utils/constants/color.dart';

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

    return GetMaterialApp(
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      debugShowCheckedModeBanner: false,

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Brothers Store',
      themeMode: ThemeMode.system,
      theme: Get.locale?.languageCode == 'en'
          ? TAppTheme.lightThemeEg
          : TAppTheme.lightThemeArabic,
      darkTheme: Get.locale?.languageCode == 'en'
          ? TAppTheme.darkThemeEg
          : TAppTheme.lightThemeArabic,

      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      //    CountryLocalizations.delegate,
      supportedLocales: AppLocalizations.supportedLocales,

      // localizationsDelegates: const [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],

      home: const Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
