import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  static const _kCenterTitle = true;
  static const _kPrimaryColor = Colors.purple;
  static const _kSecondaryColor = Colors.indigo;
  static const _kBorderRadius = 14.0;
  static const _kToolbarHeight = 62.5;
  static const _kShadowBlurRadiusBig = 16.0;
  static const _kShadowBlurRadiusSmall = 8.0;
  static const _kShadowOffsetBig = Offset(6, 6);
  static const _kShadowOffsetSmall = Offset(3, 3);

  static const _kLightBackgroundColor = Colors.white;
  static const kSecondaryLightBackgroundColor =
      Color.fromARGB(255, 235, 245, 255);
  static const _kDarkBackgroundColor = Colors.black;
  static const kSecondaryDarkBackgroundColor = Color.fromARGB(255, 15, 25, 30);
  static final kShadowColor = Colors.grey.withOpacity(0.3);

  static LinearGradient get greenToBlueGradient => LinearGradient(
        colors: [
          _kSecondaryColor[200]!,
          _kPrimaryColor[200]!,
        ],
      );

  static LinearGradient get blueToGreenGradient => LinearGradient(
        colors: [
          _kPrimaryColor[200]!,
          _kSecondaryColor[200]!,
        ],
      );

  static List<BoxShadow> get bigBoxShadow => [
        BoxShadow(
          blurRadius: _kShadowBlurRadiusBig,
          offset: _kShadowOffsetBig,
          color: kShadowColor,
        )
      ];

  static List<BoxShadow> get smallBoxShadow => [
        BoxShadow(
          blurRadius: _kShadowBlurRadiusSmall,
          offset: _kShadowOffsetSmall,
          color: kShadowColor,
        )
      ];

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        primaryColor: _kPrimaryColor,
        scaffoldBackgroundColor: _kLightBackgroundColor,
        colorScheme: _lightColorScheme,
        shadowColor: kShadowColor,
        splashColor: kShadowColor,
        hoverColor: kShadowColor,
        appBarTheme: _appBarTheme(
          _kLightBackgroundColor,
          SystemUiOverlayStyle.dark,
        ),
        textButtonTheme: _textButtonTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        cardTheme: _cardTheme(kSecondaryLightBackgroundColor),
        dialogTheme: _dialogTheme,
        bottomSheetTheme: _bottomSheetTheme(kSecondaryLightBackgroundColor),
        bottomNavigationBarTheme:
            _bottomNavigationBarTheme(kSecondaryLightBackgroundColor),
        floatingActionButtonTheme: _floatingActionButtonTheme(Colors.white),
        datePickerTheme: _datePickerTheme(kSecondaryLightBackgroundColor),
        drawerTheme: _drawerTheme(kSecondaryLightBackgroundColor),
        scrollbarTheme: _scrollbarTheme,
        listTileTheme: _listTileTheme,
        popupMenuTheme: _popupMenuTheme(kSecondaryLightBackgroundColor),
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        primaryColor: _kPrimaryColor,
        scaffoldBackgroundColor: _kDarkBackgroundColor,
        colorScheme: _darkColorScheme,
        shadowColor: kShadowColor,
        splashColor: kShadowColor,
        hoverColor: kShadowColor,
        appBarTheme: _appBarTheme(
          _kDarkBackgroundColor,
          SystemUiOverlayStyle.light,
        ),
        textButtonTheme: _textButtonTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        cardTheme: _cardTheme(kSecondaryDarkBackgroundColor),
        dialogTheme: _dialogTheme,
        bottomSheetTheme: _bottomSheetTheme(kSecondaryDarkBackgroundColor),
        bottomNavigationBarTheme:
            _bottomNavigationBarTheme(kSecondaryDarkBackgroundColor),
        floatingActionButtonTheme: _floatingActionButtonTheme(Colors.black),
        datePickerTheme: _datePickerTheme(kSecondaryDarkBackgroundColor),
        drawerTheme: _drawerTheme(kSecondaryDarkBackgroundColor),
        scrollbarTheme: _scrollbarTheme,
        listTileTheme: _listTileTheme,
        popupMenuTheme: _popupMenuTheme(kSecondaryDarkBackgroundColor),
      );

  // Esquemas de Cores
  static final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
    seedColor: _kPrimaryColor,
    brightness: Brightness.light,
    surface: _kLightBackgroundColor,
    surfaceTint: _kLightBackgroundColor,
    primary: _kPrimaryColor,
    secondary: _kSecondaryColor,
    shadow: kShadowColor,
  );

  static final ColorScheme _darkColorScheme = ColorScheme.fromSeed(
    seedColor: _kPrimaryColor,
    brightness: Brightness.dark,
    surface: Colors.transparent,
    surfaceTint: Colors.transparent,
    primary: _kPrimaryColor,
    secondary: _kSecondaryColor,
    shadow: kShadowColor,
  );

  // AppBar Theme
  static AppBarTheme _appBarTheme(
    Color backgroundColor,
    SystemUiOverlayStyle systemOverlayStyle,
  ) {
    return AppBarTheme(
      toolbarHeight: _kToolbarHeight,
      centerTitle: _kCenterTitle,
      backgroundColor: backgroundColor,
      systemOverlayStyle: systemOverlayStyle,
      shadowColor: kShadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_kBorderRadius),
      ),
    );
  }

  // Button Themes
  static final TextButtonThemeData _textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_kBorderRadius),
      ),
    ),
  );

  static final ElevatedButtonThemeData _elevatedButtonTheme =
      ElevatedButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: _kPrimaryColor,
      foregroundColor: _kLightBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_kBorderRadius),
      ),
    ),
  );

  // Card Theme
  static CardTheme _cardTheme(Color color) {
    return CardTheme(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_kBorderRadius),
      ),
    );
  }

  // Dialog Theme
  static final DialogTheme _dialogTheme = DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_kBorderRadius),
    ),
  );

  // Bottom Sheet Theme
  static BottomSheetThemeData _bottomSheetTheme(Color backgroundColor) {
    return BottomSheetThemeData(
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(_kBorderRadius),
        ),
      ),
    );
  }

  // Bottom Navigation Bar Theme
  static BottomNavigationBarThemeData _bottomNavigationBarTheme(
      Color backgroundColor) {
    return BottomNavigationBarThemeData(
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      selectedItemColor: _kPrimaryColor,
      backgroundColor: backgroundColor,
    );
  }

  // Floating Action Button Theme
  static FloatingActionButtonThemeData _floatingActionButtonTheme(
      Color foregroundColor) {
    return FloatingActionButtonThemeData(
      foregroundColor: foregroundColor,
      backgroundColor: _kPrimaryColor,
      splashColor: kShadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }

  // Date Picker Theme
  static DatePickerThemeData _datePickerTheme(Color backgroundColor) {
    return DatePickerThemeData(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_kBorderRadius),
      ),
    );
  }

  // Drawer Theme
  static DrawerThemeData _drawerTheme(Color backgroundColor) {
    return DrawerThemeData(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_kBorderRadius),
      ),
    );
  }

  // Scrollbar Theme
  static final ScrollbarThemeData _scrollbarTheme = ScrollbarThemeData(
    interactive: true,
    radius: const Radius.circular(_kBorderRadius),
    thumbVisibility: WidgetStateProperty.all(true),
    thickness: WidgetStateProperty.all(5),
  );

  // ListTile Theme
  static final ListTileThemeData _listTileTheme = ListTileThemeData(
    subtitleTextStyle: const TextStyle(color: Colors.grey),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    ),
  );

  // PopupMenu Theme
  static PopupMenuThemeData _popupMenuTheme(Color color) {
    return PopupMenuThemeData(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }
}
