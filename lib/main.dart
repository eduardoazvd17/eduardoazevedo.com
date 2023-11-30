import 'package:eduardoazevedo/src/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'src/core/utils/app_constants.dart';
import 'src/features/home/presentation/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData get lightThemeData => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
          surfaceTint: Colors.white,
        ),
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.blueGrey[50],
        useMaterial3: true,
      );

  ThemeData get darkThemeData => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        shadowColor: Colors.grey[700],
        cardTheme: CardTheme(
          shadowColor: Colors.grey[700],
        ),
        useMaterial3: true,
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eduardo Azevedo',
      localizationsDelegates: AppConstants.localizationsDelegates,
      supportedLocales: AppConstants.supportedLocales,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (_) => HomePage(controller: HomeController()),
      },
    );
  }
}
