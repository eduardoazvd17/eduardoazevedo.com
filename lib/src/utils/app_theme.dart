import 'package:flutter/material.dart';

class AppTheme {
  static const Color _kPrimaryColor = Colors.blue;
  static const Color _kCommonColor = Colors.grey;
  static const Color _kLightBackgroundColor = Color.fromRGBO(236, 239, 241, 1);
  static const Color _kDarkBackgroundColor = Colors.black;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _kPrimaryColor,
        brightness: Brightness.light,
        surfaceTint: _kLightBackgroundColor,
        shadow: _kCommonColor.withOpacity(0.3),
      ),
      primaryColor: _kPrimaryColor,
      scaffoldBackgroundColor: _kLightBackgroundColor,
      shadowColor: _kCommonColor.withOpacity(0.3),
      hoverColor: _kCommonColor.withOpacity(0.3),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _kPrimaryColor,
        brightness: Brightness.dark,
        surfaceTint: _kDarkBackgroundColor,
        shadow: _kCommonColor.withOpacity(0.3),
      ),
      primaryColor: _kPrimaryColor,
      scaffoldBackgroundColor: _kDarkBackgroundColor,
      shadowColor: _kCommonColor.withOpacity(0.3),
      hoverColor: _kCommonColor.withOpacity(0.3),
    );
  }
}
