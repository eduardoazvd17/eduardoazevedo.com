import 'package:flutter/material.dart';

class AppThemes {
  static const Color primaryColor = Colors.blue;
  static const Color accentColor = Colors.blueGrey;
  static const Color commonColor = Colors.grey;
  static const Color errorColor = Colors.red;
  static const Color lightBackgroundColor = Color.fromRGBO(236, 239, 241, 1);
  static const Color darkBackgroundColor = Colors.black;
  static const Color lightShadowColor = Colors.black;
  static const Color darkShadowColor = Color.fromRGBO(97, 97, 97, 1);

  static final circular5 = BorderRadius.circular(5);

  static CardTheme _cardTheme({required Brightness brightness}) {
    final bool isDark = brightness == Brightness.dark;
    return CardTheme(
      shadowColor: isDark ? darkShadowColor : lightShadowColor,
    );
  }

  static BottomNavigationBarThemeData _bottomNavigationBarThemeData({
    required Brightness brightness,
  }) {
    final bool isDark = brightness == Brightness.dark;
    return BottomNavigationBarThemeData(
      selectedItemColor: Colors.blue,
      backgroundColor: isDark ? darkBackgroundColor : lightBackgroundColor,
      elevation: 0,
    );
  }

  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        surfaceTint: lightBackgroundColor,
      ),
      primaryColor: primaryColor,
      scaffoldBackgroundColor: lightBackgroundColor,
      shadowColor: lightShadowColor,
      cardTheme: _cardTheme(brightness: Brightness.light),
      bottomNavigationBarTheme: _bottomNavigationBarThemeData(
        brightness: Brightness.light,
      ),
      useMaterial3: true,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
        surfaceTint: darkBackgroundColor,
      ),
      primaryColor: primaryColor,
      scaffoldBackgroundColor: darkBackgroundColor,
      shadowColor: darkShadowColor,
      cardTheme: _cardTheme(brightness: Brightness.dark),
      bottomNavigationBarTheme: _bottomNavigationBarThemeData(
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    );
  }
}
