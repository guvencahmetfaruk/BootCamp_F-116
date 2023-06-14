// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'light/color_scheme_light.dart';
import 'light/padding_insets.dart';
import 'light/text_theme_light.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  TextThemeLight? textThemeLight = TextThemeLight.instance;
  ColorSchemeLight? colorSchemeLight = ColorSchemeLight.instance;
  PaddingInsets insets = PaddingInsets();

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
        // elevatedButtonTheme: ThemeData.light().elevatedButtonTheme,
        // fontFamily: ApplicationConstants.FONT_FAMILY,
        colorScheme: appColorScheme,
        textTheme: textTheme(),
        appBarTheme: appBarTheme(),
        inputDecorationTheme: const InputDecorationTheme(
            focusColor: Colors.black12,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.zero,
            filled: true,
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.3)),
            focusedBorder: OutlineInputBorder()),
        scaffoldBackgroundColor: Colors.white,
        // elevatedButtonTheme: ThemeData.light().elevatedButtonTheme.copyWith(),
        floatingActionButtonTheme: ThemeData.light().floatingActionButtonTheme.copyWith(),

        // buttonTheme:
        //     ThemeData.light().buttonTheme.copyWith(colorScheme: const ColorScheme.light(onError: Color(0xffFF2D55))),
        tabBarTheme: tabBarTheme,
      );

  AppBarTheme appBarTheme() {
    return ThemeData.light().appBarTheme.copyWith(
          color: Colors.white,
          titleTextStyle: const TextStyle(color: Colors.black),
          // brightness: ,
          // toolbarHeight: 50,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black87, size: 21),
          // systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          //     systemNavigationBarColor: Colors.black,
          //     statusBarColor: Colors.transparent,
          //     statusBarIconBrightness: Brightness.dark),
        );
  }

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
        labelPadding: insets.lowPaddingAll,
        labelColor: appColorScheme.surface,
        labelStyle: textThemeLight!.headline5,
        unselectedLabelColor: appColorScheme.onSecondary.withOpacity(0.2));
  }

  TextTheme textTheme() {
    return ThemeData.light().textTheme.apply();
  }

  ColorScheme get appColorScheme {
    return ColorScheme(
        primary: colorSchemeLight!.black, //xx
        secondary: const Color(0xFFfeaf00),
        surface: const Color(0xFF18598d), //xx
        background: const Color(0xffF8E1D4), //xx
        outline: const Color(0xff970A0A),
        error: Colors.red,
        onPrimary: Colors.black,
        onSecondary: Colors.white, //x
        onSurface: Colors.purple.shade300,
        onBackground: Colors.white,
        onError: const Color(0xFFF9B916), //xx
        brightness: Brightness.light);
  }
}
