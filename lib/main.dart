import 'package:eduardoazevedo/src/enums/supported_languages.dart';
import 'package:eduardoazevedo/src/enums/supported_themes.dart';
import 'package:eduardoazevedo/src/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'src/services/storage_service.dart';
import 'src/utils/app_constants.dart';
import 'src/utils/app_theme.dart';
import 'src/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerLazySingleton(() => StorageService());
  final appController = GetIt.I.registerSingleton(
    AppController(storage: GetIt.I.get<StorageService>()),
  );
  runApp(MyApp(appController: appController));
}

class MyApp extends StatelessWidget {
  final AppController appController;
  const MyApp({super.key, required this.appController});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Eduardo Azevedo',
          localizationsDelegates: AppConstants.localizationsDelegates,
          supportedLocales: AppConstants.supportedLocales,
          locale: appController.selectedLanguage?.locale,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appController.selectedTheme.themeMode,
          home: HomePage(appController: appController),
        );
      },
    );
  }
}
