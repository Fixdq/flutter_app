/// 颜色，图标，字体样式
import 'package:flutter/material.dart';

///颜色
class GlobalColors {
  static const String primaryValueString = "#24292E";
  static const String primaryLightValueString = "#42464b";
  static const String primaryDarkValueString = "#121917";
  static const String miWhiteString = "#ececec";
  static const String actionBlueString = "#267aff";
  static const String webDraculaBackgroundColorString = "#282a36";

  static const int primaryValue = 0xFF24292E;
  static const int primaryLightValue = 0xFF42464b;
  static const int primaryDarkValue = 0xFF121917;

  static const int cardWhite = 0xFFFFFFFF;
  static const int textWhite = 0xFFFFFFFF;
  static const int miWhite = 0xffececec;
  static const int white = 0xFFFFFFFF;
  static const int actionBlue = 0xff267aff;
  static const int subTextColor = 0xff959595;
  static const int subLightTextColor = 0xffc4c4c4;

  static const int mainBackgroundColor = miWhite;

  static const int mainTextColor = primaryDarkValue;
  static const int textColorWhite = white;

  static const MaterialColor primarySwatch = const MaterialColor(
    primaryValue,
    const <int, Color>{
      50: const Color(primaryLightValue),
      100: const Color(primaryLightValue),
      200: const Color(primaryLightValue),
      300: const Color(primaryLightValue),
      400: const Color(primaryLightValue),
      500: const Color(primaryValue),
      600: const Color(primaryDarkValue),
      700: const Color(primaryDarkValue),
      800: const Color(primaryDarkValue),
      900: const Color(primaryDarkValue),
    },
  );
}

/// 图标
class GlobalIcons {

  static const String FONTFAMILY = 'MaterialIcons';

  static const String LOGIN_USER = 'assets/svg/username.svg';
  static const String LOGIN_PWD = 'assets/svg/password.svg';
  static const String LOGO = 'assets/logo.png';

  static const IconData ACCESSIBILITY =IconData(59692, fontFamily: GlobalIcons.FONTFAMILY);
  static const IconData ACCOUNT_BOX =IconData(59473, fontFamily: GlobalIcons.FONTFAMILY);
  static const IconData ACCOUNT_CIRCLE =IconData(59475, fontFamily: GlobalIcons.FONTFAMILY);
  static const IconData ADB =IconData(58894, fontFamily: GlobalIcons.FONTFAMILY);




}