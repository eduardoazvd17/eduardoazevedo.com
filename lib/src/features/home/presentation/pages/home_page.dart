import 'package:eduardoazevedo/src/features/about_me/presentation/pages/about_me_page.dart';
import 'package:eduardoazevedo/src/features/contact/presentation/pages/contact_page.dart';
import 'package:eduardoazevedo/src/features/home/data/enums/home_page_tabs.dart';
import 'package:eduardoazevedo/src/features/home/presentation/controllers/home_controller.dart';
import 'package:eduardoazevedo/src/features/my_projects/presentation/pages/my_projects_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../core/widgets/responsive_builder.dart';
import '../widgets/profile_widget.dart';

class HomePage extends StatelessWidget {
  static const String route = '/';

  final HomeController controller;
  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      desktopWidget: _desktopScaffold(context),
      mobileWidget: _mobileScaffold(context),
    );
  }

  Widget _desktopScaffold(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 60),
            child: ProfileWidget(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(height: 0),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: _navigationBar(context),
                ),
                const Divider(height: 0),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(60),
            child: _pageContent(context),
          ),
        ],
      ),
    );
  }

  Widget _mobileScaffold(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 0),
          _navigationBar(context),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 60),
            child: ProfileWidget(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: _pageContent(context),
          ),
        ],
      ),
    );
  }

  Widget _navigationBar(BuildContext context) => Observer(
        builder: (context) {
          return GNav(
            selectedIndex: controller.currentPage.index,
            onTabChange: (index) => controller.changePage(
              HomePageTabs.values[index],
            ),
            tabBorderRadius: 16,
            color: Theme.of(context).iconTheme.color,
            activeColor: Theme.of(context).primaryColor,
            mainAxisAlignment: MainAxisAlignment.center,
            tabs: HomePageTabs.values.map((e) {
              return GButton(
                gap: 10,
                icon: e.icon,
                text: e.title(context),
                margin: const EdgeInsets.symmetric(horizontal: 10),
              );
            }).toList(),
          );
        },
      );

  Widget _pageContent(context) {
    final Widget widget = Observer(
      builder: (context) {
        switch (controller.currentPage) {
          case HomePageTabs.aboutMe:
            return const AboutMePage();
          case HomePageTabs.myProjects:
            return const MyProjectsPage();
          case HomePageTabs.contact:
            return const ContactPage();
        }
      },
    );

    return widget
        .animate(onInit: (controller) {
          this.controller.pageAnimationController = controller;
        })
        .fade(duration: const Duration(milliseconds: 700))
        .flipV(duration: const Duration(milliseconds: 350));
  }
}
