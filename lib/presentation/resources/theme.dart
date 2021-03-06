import 'colors.dart';
import 'fonts.dart';
import 'styles.dart';
import 'values.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors

    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
    // cardview theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppValuesSize.s4),
    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppValuesSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle:
          getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white),
    ),

    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),

// elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s17),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValuesSize.s12),
        ),
      ),
    ),
    // text theme
    // textTheme: TextTheme(
    //     displayLarge: getSemiBoldStyle(
    //         color: ColorManager.darkGrey, fontSize: FontSize.s16),
    //           headlineMedium: getRegularStyle(
    //         color: ColorManager.darkGrey, fontSize: FontSize.s14),
    //     headline1: getSemiBoldStyle(
    //         color: ColorManager.darkGrey, fontSize: FontSize.s16),
    //     subtitle1: getMediumStyle(
    //         color: ColorManager.lightGrey, fontSize: FontSize.s14),
    //     caption: getRegularStyle(color: ColorManager.grey1),
    //     bodyText1: getRegularStyle(color: ColorManager.grey)),
    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s16),
        headlineLarge: getSemiBoldStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s16),
        headlineMedium: getRegularStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s14),
        titleMedium:
            getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s16),
        titleSmall:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
        bodyLarge: getRegularStyle(color: ColorManager.grey1),
        bodySmall: getRegularStyle(color: ColorManager.grey),
        bodyMedium:
            getRegularStyle(color: ColorManager.grey2, fontSize: FontSize.s12),
        labelSmall:
            getBoldtStyle(color: ColorManager.primary, fontSize: FontSize.s12)),
    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      // hint style
      hintStyle:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      labelStyle:
          getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error),

      // enabled border style
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.grey, width: AppValuesSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppValuesSize.s8),
        ),
      ),

      // focused border style
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppValuesSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppValuesSize.s8),
        ),
      ),

      // error border style
      errorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.error, width: AppValuesSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppValuesSize.s8),
        ),
      ),
      // focused border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppValuesSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppValuesSize.s8),
        ),
      ),
    ),
  );
}
