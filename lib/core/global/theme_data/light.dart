import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/app_fonts.dart';
import '../../utils/app_sizes.dart';
import '../theme_color/theme_color_light.dart';

ThemeData get getThemeDataLight => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ThemeColorLight.primaryColor,
      brightness: Brightness.light,
      primaryIconTheme: const IconThemeData(
        color: ThemeColorLight.black,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ThemeColorLight.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark
            .copyWith(statusBarColor: ThemeColorLight.white),
        iconTheme: const IconThemeData(color: ThemeColorLight.black),
      ),
      fontFamily: AppFonts.fontFamily,
      textTheme: getTextTheme(),
    );

getTextTheme() => TextTheme(
      displaySmall: TextStyle(
        color: ThemeColorLight.grey,
        fontSize: AppSizes.fs13,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      displayMedium: TextStyle(
        color: ThemeColorLight.grayscale,
        fontSize: AppSizes.fs26,
        fontWeight: AppFonts.medium,
        fontFamily: AppFonts.fontFamily,
      ),
      displayLarge: TextStyle(
          color: ThemeColorLight.black,
          fontSize: AppSizes.fs35,
          fontWeight: AppFonts.regular,
          fontFamily: AppFonts.fontFamily,
          height: AppSizes.pH1),
      headlineLarge: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs60,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      headlineMedium: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs14,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
      headlineSmall: TextStyle(
        color: ThemeColorLight.grayscale,
        fontSize: AppSizes.fs14,
        fontWeight: AppFonts.bold,
        fontFamily: AppFonts.fontFamily,
      ),
      bodySmall: TextStyle(
        color: ThemeColorLight.grayscale,
        fontSize: AppSizes.fs12,
        fontWeight: AppFonts.bold,
        fontFamily: AppFonts.fontFamily,
      ),
      bodyMedium: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs18,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
      bodyLarge: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs20,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      titleSmall: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs13,
        fontWeight: AppFonts.bold,
        fontFamily: AppFonts.fontFamily,
      ),
      titleMedium: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs24,
        fontWeight: AppFonts.bold,
        fontFamily: AppFonts.fontFamily,
      ),
      titleLarge: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs18,
        fontWeight: AppFonts.bold,
        fontFamily: AppFonts.fontFamily,
      ),
      labelSmall: TextStyle(
        color: ThemeColorLight.grayscaleBold,
        fontSize: AppSizes.fs10,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      labelMedium: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs15,
        fontWeight: AppFonts.bold,
        fontFamily: AppFonts.fontFamily,
      ),
      labelLarge: TextStyle(
        color: ThemeColorLight.labelColor,
        fontSize: AppSizes.fs14,
        fontWeight: AppFonts.bold,
        fontFamily: AppFonts.fontFamily,
      ),
    );
