import 'package:advanced_flutter_course/presentation/resources/colors_manager.dart';
import 'package:advanced_flutter_course/presentation/resources/fonts_manager.dart';
import 'package:advanced_flutter_course/presentation/resources/styles_manager.dart';
import 'package:advanced_flutter_course/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData appThemeManager() {
  return ThemeData(
    //* main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkprimary,
    disabledColor: ColorManager.grey1, // i.e., for disabled button
    splashColor: ColorManager.primaryOpacity70,

    //* card view theme
    cardTheme: const CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSizeManager.s4,
    ),

    //* appbar theme
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primary,
      centerTitle: true,
      elevation: AppSizeManager.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: regularTextStyleManager(
        color: ColorManager.white,
        fontSize: FontSizeManager.s16,
      ),
    ),

    //* button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70,
    ),

    //* elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: regularTextStyleManager(color: ColorManager.white),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizeManager.s12)),
      ),
    ),

    //* text theme
    textTheme: TextTheme(
      displayLarge: semiBoldTextStyleManager(
          color: ColorManager.darkGrey, fontSize: FontSizeManager.s16),
      titleMedium: mediumTextStyleManager(
          color: ColorManager.lightGrey, fontSize: FontSizeManager.s14),
      titleSmall: mediumTextStyleManager(
          color: ColorManager.primary, fontSize: FontSizeManager.s14),
      bodySmall: regularTextStyleManager(color: ColorManager.grey1),
      bodyLarge: regularTextStyleManager(color: ColorManager.grey),
    ),

    //* input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPaddingManager.p8),
      hintStyle: regularTextStyleManager(color: ColorManager.grey1),
      labelStyle: mediumTextStyleManager(color: ColorManager.grey),
      errorStyle: regularTextStyleManager(color: ColorManager.error),
      enabledBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.grey, width: AppSizeManager.s1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizeManager.s8),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSizeManager.s1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizeManager.s8),
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.error, width: AppSizeManager.s1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizeManager.s8),
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSizeManager.s1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizeManager.s8),
        ),
      ),
    ),
  );
}
  