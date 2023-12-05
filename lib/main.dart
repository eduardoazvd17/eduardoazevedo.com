import 'package:eduardoazevedo/src/core/data/enums/supported_languages.dart';
import 'package:eduardoazevedo/src/core/data/enums/supported_themes.dart';
import 'package:eduardoazevedo/src/core/data/utils/app_routes.dart';
import 'package:eduardoazevedo/src/core/presentation/controllers/app_controller.dart';
import 'package:eduardoazevedo/src/features/home/presentation/controllers/email_controller.dart';
import 'package:eduardoazevedo/src/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'src/core/data/utils/app_constants.dart';
import 'src/core/data/utils/app_themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerLazySingleton(() => AppController());
  GetIt.I.registerLazySingleton(() => HomeController());
  GetIt.I.registerLazySingleton(() => EmailController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final appController = GetIt.I.get<AppController>();

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Eduardo Azevedo',
          localizationsDelegates: AppConstants.localizationsDelegates,
          supportedLocales: AppConstants.supportedLocales,
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          routerConfig: AppRoutes.routerConfig,
          themeMode: appController.selectedTheme?.themeMode,
          locale: appController.selectedLanguage?.locale,
        );
      },
    );
  }
}
