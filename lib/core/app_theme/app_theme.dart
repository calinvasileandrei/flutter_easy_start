import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static Color lightBackgroundColor = const Color(0xfff2f2f2);
  static Color lightPrimaryColor = const Color(0xfff2f2f2);
  static Color lightAccentColor = Color(0xffFA7B58);
  static Color lightParticlesColor = const Color(0x44948282);
  static const Color lightHeadlineColor = Colors.black45;
  static const Color lightParagraphColor = Colors.black87;

  static Color darkBackgroundColor = const Color(0xFF1A2127);
  static Color darkPrimaryColor = Colors.white;
  static Color darkAccentColor = Color(0xffFA7B58);
  static Color darkParticlesColor = const Color(0x441C2A3D);
  static const Color darkHeadlineColor = Colors.white;
  static const Color darkParagraphColor = Colors.white;

  static TextTheme darkTextTheme = TextTheme(
    headline1: TextStyle(
        color: darkHeadlineColor,
        fontFamily: 'Lato',
        letterSpacing: -1.5,
        fontWeight: FontWeight.w900,
        fontSize: 96.sp,
        fontStyle: FontStyle.normal),
    headline2: TextStyle(
        color: darkHeadlineColor,
        letterSpacing: -0.5,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w900,
        fontSize: 60.sp,
        fontStyle: FontStyle.italic),
    headline3: TextStyle(
        color: darkHeadlineColor,
        letterSpacing: 0,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w700,
        fontSize: 48.sp,
        fontStyle: FontStyle.normal),
    headline4: TextStyle(
        color: darkHeadlineColor,
        letterSpacing: 0.25,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w700,
        fontSize: 34.sp,
        fontStyle: FontStyle.italic),
    headline5: TextStyle(
        color: darkHeadlineColor,
        letterSpacing: 0,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w700,
        fontSize: 24.sp,
        fontStyle: FontStyle.normal),
    headline6: TextStyle(
        color: darkHeadlineColor,
        letterSpacing: 0.15,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
        fontStyle: FontStyle.italic),
    subtitle1: TextStyle(
        color: darkParagraphColor,
        letterSpacing: 0.15,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        fontStyle: FontStyle.normal),
    subtitle2: TextStyle(
        color: darkParagraphColor,
        letterSpacing: 0.1,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        fontStyle: FontStyle.normal),
    bodyText1: TextStyle(
        color: darkParagraphColor,
        letterSpacing: 0.5,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        fontStyle: FontStyle.normal),
    bodyText2: TextStyle(
        color: darkParagraphColor,
        letterSpacing: 0.25,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w300,
        fontSize: 14.sp,
        fontStyle: FontStyle.normal),
    button: TextStyle(//capitalized
        color: darkHeadlineColor,
        letterSpacing: 1.25,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        fontStyle: FontStyle.normal),
    caption: TextStyle(
        color: darkParagraphColor,
        letterSpacing: 0.4,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w300,
        fontSize: 12.sp,
        fontStyle: FontStyle.normal),
    overline: TextStyle( //capitalized
        color: darkParagraphColor,
        letterSpacing: 1.5,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w100,
        fontSize: 10.sp,
        fontStyle: FontStyle.italic),
  );
  static TextTheme lightTextTheme = TextTheme(
    headline1: TextStyle(
        color: lightHeadlineColor,
        fontFamily: 'Lato',
        letterSpacing: -1.5,
        fontWeight: FontWeight.w900,
        fontSize: 96.sp,
        fontStyle: FontStyle.normal),
    headline2: TextStyle(
        color: lightHeadlineColor,
        letterSpacing: -0.5,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w900,
        fontSize: 60.sp,
        fontStyle: FontStyle.italic),
    headline3: TextStyle(
        color: lightHeadlineColor,
        letterSpacing: 0,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w700,
        fontSize: 48.sp,
        fontStyle: FontStyle.normal),
    headline4: TextStyle(
        color: lightHeadlineColor,
        letterSpacing: 0.25,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w700,
        fontSize: 34.sp,
        fontStyle: FontStyle.italic),
    headline5: TextStyle(
        color: lightHeadlineColor,
        letterSpacing: 0,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w700,
        fontSize: 24.sp,
        fontStyle: FontStyle.normal),
    headline6: TextStyle(
        color: lightHeadlineColor,
        letterSpacing: 0.15,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
        fontStyle: FontStyle.italic),
    subtitle1: TextStyle(
        color: lightParagraphColor,
        letterSpacing: 0.15,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        fontStyle: FontStyle.normal),
    subtitle2: TextStyle(
        color: lightParagraphColor,
        letterSpacing: 0.1,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        fontStyle: FontStyle.normal),
    bodyText1: TextStyle(
        color: lightParagraphColor,
        letterSpacing: 0.5,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        fontStyle: FontStyle.normal),
    bodyText2: TextStyle(
        color: lightParagraphColor,
        letterSpacing: 0.25,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w300,
        fontSize: 14.sp,
        fontStyle: FontStyle.normal),
    button: TextStyle(//capitalized
        color: lightHeadlineColor,
        letterSpacing: 1.25,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        fontStyle: FontStyle.normal),
    caption: TextStyle(
        color: lightParagraphColor,
        letterSpacing: 0.4,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w300,
        fontSize: 12.sp,
        fontStyle: FontStyle.normal),
    overline: TextStyle( //capitalized
        color: lightParagraphColor,
        letterSpacing: 1.5,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w100,
        fontSize: 10.sp,
        fontStyle: FontStyle.italic),
  );

  const AppTheme._();

  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: lightPrimaryColor,
      accentColor: lightAccentColor,
      buttonColor: lightHeadlineColor,
      backgroundColor: lightBackgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: lightTextTheme);

  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: darkPrimaryColor,
      accentColor: darkAccentColor,
      buttonColor: darkHeadlineColor,
      backgroundColor: darkBackgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: darkTextTheme);

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance!.window.platformBrightness;

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
