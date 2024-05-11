import 'package:brother_store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:brother_store/utils/theme/custom_themes/elevated_button.theme.dart';
import 'package:brother_store/utils/theme/custom_themes/text_field_theme.dart';
import 'package:brother_store/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

import 'custom_themes/appbar_theme.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'AvenirArabic',
      brightness: Brightness.light,
      primaryColor: const Color.fromARGB(190, 191, 0, 255),
      // primaryColor: TColors.primary,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TTextTheme.lightTextTheme,
      appBarTheme: TAppBarTheme.lightAppBarTheme,
      bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationThem);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'AvenirArabic',
      brightness: Brightness.dark,
      primaryColor: const Color.fromARGB(190, 191, 0, 255),
      // primaryColor: TColors.primary,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TTextTheme.darkTextTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationThem);
}
