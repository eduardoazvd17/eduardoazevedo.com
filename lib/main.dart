import 'package:eduardoazevedo/src/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'src/core/utils/app_constants.dart';
import 'src/core/utils/app_themes.dart';
import 'src/features/home/presentation/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eduardo Azevedo',
      localizationsDelegates: AppConstants.localizationsDelegates,
      supportedLocales: AppConstants.supportedLocales,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (_) => HomePage(controller: HomeController()),
      },
    );
  }
}
