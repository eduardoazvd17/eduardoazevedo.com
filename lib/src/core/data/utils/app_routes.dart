import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../features/home/presentation/controllers/home_controller.dart';
import '../../../features/home/presentation/pages/home_page.dart';

class AppRoutes {
  static const String home = "/";
  static const String aboutMe = "aboutMe/";
  static const String myProjects = "myProjects/";
  static const String contact = "contact/";

  static RouterConfig<Object> get routerConfig {
    return GoRouter(
      routes: [
        GoRoute(
          name: 'home',
          path: home,
          builder: (context, state) {
            return HomePage(
              controller: GetIt.I.get<HomeController>(),
            );
          },
        ),
      ],
    );
  }
}
