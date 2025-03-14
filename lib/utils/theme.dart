import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color.fromARGB(255, 185, 90, 0);
  static const Color primaryLight = Color(0xFFE8ECFF);
  static const Color primaryShade1 = Color(0xFFD2DBFC);
  static const Color primaryShade2 = Color(0xFF080C18);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightBody = Color.fromARGB(255, 247, 246, 229);
  static const Color darkBody = Color(0xFF02050F);

  static const Color boldBlack = Color(0xFF212121);
  static const Color lightGrey = Color(0xFFf4f4fa);
  static const Color hotpink = Color(0xFFCA0E0E);
  static const Color accent = Color(0xffFABE00);
  static const Color tealColor = Color(0xff00ADB2);
  // static const Color primary1 = Color(0xff3ab349);
  static const Color dark = Color(0xff2D2D2D);
  static const Color secondary = Color(0xfff89320);
  static const Color tetiary = Color(0xff00ADB2);
  // static const Color white = Color(0xffffffff);

  static Color bw(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : boldBlack;
  }

  static Color danger(BuildContext context) {
    return (Theme.of(context).brightness == Brightness.light
        ? Colors.red[900]
        : Colors.red[200]) as Color;
  }

  static Color dangerInvert(BuildContext context) {
    return (Theme.of(context).brightness != Brightness.light
        ? Colors.red[900]
        : Colors.red[200]) as Color;
  }

  static Color success(BuildContext context) {
    return (Theme.of(context).brightness == Brightness.light
        ? Colors.green[800]
        : Colors.green[200]) as Color;
  }

  static Color successInvert(BuildContext context) {
    return (Theme.of(context).brightness != Brightness.light
        ? Colors.green[800]
        : Colors.green[200]) as Color;
  }

  static Color getOppositeColor(Color color) {
    return Color.fromARGB(
      color.alpha,
      255 - color.red,
      255 - color.green,
      255 - color.blue,
    );
  }
}

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.lightBody,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      
        backgroundColor: AppColors.white, elevation: 0),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
      headlineMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
      bodySmall: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
    ),
    iconTheme: IconThemeData(
      color: AppColors.primary,
      size: 24,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
