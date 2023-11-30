import 'package:eduardoazevedo/src/features/about_me/presentation/pages/about_me_page.dart';
import 'package:eduardoazevedo/src/features/contact/presentation/pages/contact_page.dart';
import 'package:eduardoazevedo/src/features/home/data/enums/home_page_tabs.dart';
import 'package:eduardoazevedo/src/features/home/presentation/controllers/home_controller.dart';
import 'package:eduardoazevedo/src/features/my_projects/presentation/pages/my_projects_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
            padding: EdgeInsets.symmetric(vertical: 58),
            child: ProfileWidget(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 58),
            child: _navigationBar(context),
          ),
          Padding(
            padding: const EdgeInsets.all(58),
            child: _pageContent(context),
          ),
        ],
      ),
    );
  }

  Widget _mobileScaffold(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 58),
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

  Widget _bottomNavigationBar(BuildContext context) => Observer(
        builder: (context) {
          return BottomNavigationBar(
            currentIndex: controller.currentPage.index,
            onTap: (index) => controller.changePage(
              HomePageTabs.values[index],
            ),
            items: HomePageTabs.values.map((e) {
              return BottomNavigationBarItem(
                icon: Icon(e.icon),
                label: e.title(context),
              );
            }).toList(),
          ).animate().fade();
        },
      );

  Widget _navigationBar(BuildContext context) => Column(
        children: [
          const Divider(height: 0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Observer(
              builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: HomePageTabs.values.map((page) {
                    final bool isSelected = controller.currentPage == page;

                    return DecoratedBox(
                      decoration: BoxDecoration(
                        border: isSelected
                            ? BorderDirectional(
                                bottom: BorderSide(
                                  width: 1.5,
                                  color: Theme.of(context).primaryColor,
                                ),
                              )
                            : null,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: InkWell(
                          onTap: () => controller.changePage(page),
                          borderRadius: BorderRadius.circular(5),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  page.icon,
                                  color: isSelected
                                      ? Theme.of(context).primaryColor
                                      : null,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  page.title(context),
                                  style: isSelected
                                      ? TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        )
                                      : null,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          const Divider(height: 0),
        ],
      ).animate().fade();

  Widget _pageContent(context) {
    return Observer(
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
  }
}
