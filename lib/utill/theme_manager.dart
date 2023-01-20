import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

import 'color_manager.dart';

ThemeData getLightTheme() {
  return ThemeData(
      // dashboard colors
      primaryColor: ColorManager.yellow,
      accentColor: ColorManager.black,
      scaffoldBackgroundColor: ColorManager.white,
      splashColor: ColorManager.grey3,
      dialogBackgroundColor: ColorManager.white,

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(textStyle: style_600_14(ColorManager.yellow),padding: EdgeInsets.zero,foregroundColor: ColorManager.yellow)
      ),

      // bottomNavigationBar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorManager.grey4,
        elevation: AppFixedSize.s0,
        selectedIconTheme: const IconThemeData(
          color: ColorManager.yellow,
        ),
        unselectedIconTheme:
            const IconThemeData(color: ColorManager.grey3),
        selectedItemColor: ColorManager.yellow,
        unselectedItemColor: ColorManager.grey3,
        selectedLabelStyle: style_700_10(ColorManager.yellow),
        unselectedLabelStyle: style_500_10(ColorManager.grey3),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      iconTheme: IconThemeData(color: ColorManager.black1),
      // cardView theme
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppFixedSize.s4),
      // app bar theme
      appBarTheme: AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarIconBrightness: Brightness.dark),
          color: ColorManager.white,
          elevation: AppFixedSize.s0,
          titleTextStyle: style_700_18(ColorManager.black),
      ),
      // button theme
      buttonTheme: const ButtonThemeData(
          shape: RoundedRectangleBorder(),
          disabledColor: ColorManager.grey,
          buttonColor: ColorManager.yellow,
          splashColor: ColorManager.grey3),

      // elevated button them
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: style_700_16(ColorManager.white),
              backgroundColor: ColorManager.yellow,
              disabledForegroundColor: ColorManager.grey ,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r)))),
      // Outlined button theme
      // outlinedButtonTheme: OutlinedButtonThemeData(
      //   style: OutlinedButton.styleFrom(
      //       padding: EdgeInsets.symmetric(vertical: AppHeight.h18),
      //       backgroundColor: ColorManager.darkPrimary,
      //       side: const BorderSide(
      //           color: ColorManager.greyScale_200, style: BorderStyle.solid),
      //       shape: RoundedRectangleBorder(
      //           side: const BorderSide(
      //             color: ColorManager.greyScale_200,
      //           ),
      //           borderRadius: BorderRadius.circular(AppRadius.r10))),
      // ),

      // input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(
        prefixStyle: const TextStyle(color: ColorManager.black1),
        focusColor: ColorManager.grey,
        fillColor: ColorManager.grey,
        hoverColor: ColorManager.grey,
        prefixIconColor: ColorManager.black1,
        suffixIconColor: ColorManager.black1,
        contentPadding: EdgeInsets.symmetric(
            vertical: AppHeight.h18, horizontal: AppWidth.w20),
        hintStyle: style_400_14(ColorManager.grey5),
        labelStyle: style_600_14(ColorManager.black),
        errorStyle: style_400_12(ColorManager.red),
        //prefixIconColor: ColorManager.greyScale_500,
        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.grey3, width: AppFixedSize.s1),
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.r12))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.yellow, width: AppFixedSize.s1),
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.r12))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.red, width: AppFixedSize.s1),
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.r12))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.red, width: AppFixedSize.s1),
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.r12))),
      ));
}

ThemeData getDarkTheme() {
  return ThemeData(
    // dashboard colors
    primaryColor: ColorManager.yellow,
    accentColor: ColorManager.white2,
    splashColor: ColorManager.grey2,
    scaffoldBackgroundColor: ColorManager.black2,
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(textStyle: style_600_14(ColorManager.yellow),padding: EdgeInsets.zero,foregroundColor: ColorManager.yellow)
    ),
    dialogBackgroundColor: ColorManager.black2,
    // bottomNavigationBar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.grey6,
      elevation: AppFixedSize.s0,
      selectedIconTheme: const IconThemeData(
        color: ColorManager.yellow,
      ),
      unselectedIconTheme:
          const IconThemeData(color: ColorManager.grey7),
      selectedItemColor: ColorManager.yellow,
      unselectedItemColor: ColorManager.grey7,
      selectedLabelStyle: style_700_10(ColorManager.yellow),
      unselectedLabelStyle: style_500_10(ColorManager.grey7),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),

    // cardView theme
    cardTheme: CardTheme(
        color: ColorManager.black2,
        shadowColor: ColorManager.grey2,
        elevation: AppFixedSize.s4),

    // app bar theme
    appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorManager.black2,
          statusBarIconBrightness: Brightness.light,
        ),
        color: ColorManager.black2,
        elevation: AppFixedSize.s0,
        titleTextStyle: style_700_18(ColorManager.white)),

    // button theme
    buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
          disabledColor: ColorManager.grey2,
        buttonColor: ColorManager.yellow,
        splashColor: ColorManager.grey2),
iconTheme: IconThemeData(color: ColorManager.white2),
    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: style_700_16(ColorManager.white),
            backgroundColor: ColorManager.yellow,
            disabledForegroundColor: ColorManager.grey2 ,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.r100)))),

    // Outlined button theme
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: OutlinedButton.styleFrom(
    //       padding: EdgeInsets.symmetric(vertical: AppHeight.h18),
    //       backgroundColor: ColorManager.dark_2,
    //       side: const BorderSide(
    //           color: ColorManager.dark_3, style: BorderStyle.solid),
    //       shape: RoundedRectangleBorder(
    //           side: const BorderSide(
    //             color: ColorManager.dark_3,
    //           ),
    //           borderRadius: BorderRadius.circular(AppRadius.r10))),
    // ),
    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
        focusColor: ColorManager.grey2,
        fillColor: ColorManager.grey2,
        hoverColor: ColorManager.grey2,
        prefixStyle: const TextStyle(color: ColorManager.white2),
        contentPadding: EdgeInsets.symmetric(
            vertical: AppHeight.h18, horizontal: AppWidth.w20),
        hintStyle: style_400_14(ColorManager.grey8),
        labelStyle: style_600_14(ColorManager.white),
        errorStyle: style_400_12(ColorManager.red),
        prefixIconColor: ColorManager.white2,
        suffixIconColor: ColorManager.white2,

        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.white2, width: AppFixedSize.s1),
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.r12))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.yellow, width: AppFixedSize.s1),
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.r12))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.red, width: AppFixedSize.s1),
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.r12))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.yellow, width: AppFixedSize.s1),
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.r12)))),
  );
}
