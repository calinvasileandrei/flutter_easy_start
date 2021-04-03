import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
      static Color lightBackgroundColor = const Color(0xfff2f2f2);
      static Color lightPrimaryColor = const Color(0xfff2f2f2);
      static Color lightAccentColor = Colors.blueGrey.shade200;
      static Color lightParticlesColor = const Color(0x44948282);
      static const Color lightHeadlineColor = Color(0xff094067);
      static const Color lightParagraphColor = Color(0xff5f6c7b);

      static Color darkBackgroundColor = const Color(0xFF1A2127);
      static Color darkPrimaryColor = const Color(0xFF1A2127);
      static Color darkAccentColor = Colors.blueGrey.shade600;
      static Color darkParticlesColor = const Color(0x441C2A3D);
      static const Color darkHeadlineColor = Color(0xff094067);
      static const Color darkParagraphColor = Color(0xff5f6c7b);

      static TextTheme darkTextTheme = const TextTheme(
            headline1: TextStyle(
                color: darkHeadlineColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w900,
                fontSize: 96,
                fontStyle: FontStyle.normal),
            headline2: TextStyle(
                color: darkHeadlineColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w900,
                fontSize: 96,
                fontStyle: FontStyle.italic),
            headline3: TextStyle(
                color: darkHeadlineColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                fontSize: 64,
                fontStyle: FontStyle.normal),
            headline4: TextStyle(
                color: darkHeadlineColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                fontSize: 64,
                fontStyle: FontStyle.italic),
            headline5: TextStyle(
                color: darkHeadlineColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                fontSize: 48,
                fontStyle: FontStyle.normal),
            headline6: TextStyle(
                color: darkHeadlineColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                fontSize: 48,
                fontStyle: FontStyle.italic),
            subtitle1: TextStyle(
                color: darkParagraphColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                fontSize: 32,
                fontStyle: FontStyle.normal),
            subtitle2: TextStyle(
                color: darkParagraphColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                fontSize: 24,
                fontStyle: FontStyle.normal),
            bodyText1: TextStyle(
                color: darkParagraphColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontStyle: FontStyle.normal),
            bodyText2: TextStyle(
                color: darkParagraphColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w300,
                fontSize: 14,
                fontStyle: FontStyle.normal),
            button: TextStyle(
                color: darkHeadlineColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontStyle: FontStyle.normal),
            caption: TextStyle(
                color: darkParagraphColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w300,
                fontSize: 12,
                fontStyle: FontStyle.normal),
            overline: TextStyle(
                color: darkParagraphColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w100,
                fontSize: 12,
                fontStyle: FontStyle.italic),
      );
      static TextTheme lightTextTheme = const TextTheme(
            headline1: TextStyle(
                color: lightHeadlineColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w900,
                fontSize: 96,
                fontStyle: FontStyle.normal),
            headline2: TextStyle(
                color: lightHeadlineColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w900,
                fontSize: 96,
                fontStyle: FontStyle.italic),
            headline3: TextStyle(
                color: lightHeadlineColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                fontSize: 64,
                fontStyle: FontStyle.normal),
            headline4: TextStyle(
                color: lightHeadlineColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                fontSize: 64,
                fontStyle: FontStyle.italic),
            headline5: TextStyle(
                color: lightHeadlineColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                fontSize: 48,
                fontStyle: FontStyle.normal),
            headline6: TextStyle(
                color: lightHeadlineColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                fontSize: 48,
                fontStyle: FontStyle.italic),
            subtitle1: TextStyle(
                color: lightParagraphColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                fontSize: 32,
                fontStyle: FontStyle.normal),
            subtitle2: TextStyle(
                color: lightParagraphColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                fontSize: 24,
                fontStyle: FontStyle.normal),
            bodyText1: TextStyle(
                color: lightParagraphColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontStyle: FontStyle.normal),
            bodyText2: TextStyle(
                color: lightParagraphColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w300,
                fontSize: 14,
                fontStyle: FontStyle.normal),
            button: TextStyle(
                color: lightHeadlineColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontStyle: FontStyle.normal),
            caption: TextStyle(
                color: lightParagraphColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w300,
                fontSize: 12,
                fontStyle: FontStyle.normal),
            overline: TextStyle(
                color: lightParagraphColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w100,
                fontSize: 12,
                fontStyle: FontStyle.italic),
      );

      const AppTheme._();

      static final lightTheme = ThemeData(
            brightness: Brightness.light,
            primaryColor: lightPrimaryColor,
            accentColor: lightAccentColor,
            backgroundColor: lightBackgroundColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: lightTextTheme
      );

      static final darkTheme = ThemeData(
            brightness: Brightness.dark,
            primaryColor: darkPrimaryColor,
            accentColor: darkAccentColor,
            backgroundColor: darkBackgroundColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: darkTextTheme
      );

      static Brightness get currentSystemBrightness =>
          SchedulerBinding.instance.window.platformBrightness;

      static void setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness:
                  themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
                  systemNavigationBarIconBrightness:
                  themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
                  systemNavigationBarColor: themeMode == ThemeMode.light
                      ? lightBackgroundColor
                      : darkBackgroundColor,
                  systemNavigationBarDividerColor: Colors.transparent,
            ));
      }
}

extension ThemeExtras on ThemeData {
      Color get particlesColor => this.brightness == Brightness.light
          ? AppTheme.lightParticlesColor
          : AppTheme.darkParticlesColor;
}
