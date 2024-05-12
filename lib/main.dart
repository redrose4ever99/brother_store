import 'package:brother_store/l10n/l10n.dart';
import 'package:brother_store/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/authontication/screens/onboarding/onboarding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Brothers Store',
    themeMode: ThemeMode.system,
    theme: TAppTheme.lightTheme,
    darkTheme: TAppTheme.darkTheme,
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: L10n.all,
    textDirection: Get.locale?.languageCode == 'ar'
        ? TextDirection.ltr
        : TextDirection.rtl,
    home: Directionality(
        textDirection: Get.locale?.languageCode == 'ar'
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: const OnBoardingScreen()),
  ));
}
