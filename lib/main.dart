import 'package:eduardoazevedo/src/core/presentation/controllers/app_controller.dart';
import 'package:eduardoazevedo/src/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'src/core/data/utils/app_constants.dart';
import 'src/core/data/utils/app_themes.dart';
import 'src/features/home/presentation/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton(() => AppController());
  GetIt.I.registerLazySingleton(() => HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Eduardo Azevedo',
      localizationsDelegates: AppConstants.localizationsDelegates,
      supportedLocales: AppConstants.supportedLocales,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            name: 'home',
            path: HomePage.route,
            builder: (context, state) {
              return HomePage(controller: GetIt.I.get<HomeController>());
            },
          ),
        ],
      ),
    );
  }
}
