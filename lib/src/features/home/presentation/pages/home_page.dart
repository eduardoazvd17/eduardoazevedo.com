import 'package:eduardoazevedo/src/core/data/utils/app_constants.dart';
import 'package:eduardoazevedo/src/features/home/data/enums/home_page_tabs.dart';
import 'package:eduardoazevedo/src/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../core/presentation/widgets/responsive_builder.dart';
import '../widgets/profile_widget.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;
  final HomePageTabs initialTab;
  const HomePage({
    super.key,
    required this.controller,
    this.initialTab = HomePageTabs.myProjects, //!TEMP
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.changePage(initialTab);
    });

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
            padding: EdgeInsets.symmetric(vertical: 30),
            child: ProfileWidget(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: _navigationBar(context, true),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
            child: _pageContent(context),
          ),
        ],
      ),
    );
  }

  Widget _mobileScaffold(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _navigationBar(context, false),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: ProfileWidget(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: _pageContent(context),
          ),
        ],
      ),
    );
  }

  Widget _navigationBar(BuildContext context, bool isDesktop) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(height: 0),
        Observer(
          builder: (context) {
            return GNav(
              selectedIndex: controller.currentPage.index,
              onTabChange: (index) => controller.changePage(
                HomePageTabs.values[index],
              ),
              tabBorderRadius: 16,
              color: Theme.of(context).iconTheme.color,
              activeColor: Theme.of(context).primaryColor,
              mainAxisAlignment: isDesktop
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.center,
              tabs: HomePageTabs.values.map((e) {
                final bool isSelected = controller.currentPage == e;
                return GButton(
                  gap: 10,
                  leading: isDesktop
                      ? Row(
                          children: [
                            Icon(
                              e.icon,
                              color: isSelected
                                  ? Theme.of(context).primaryColor
                                  : null,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              e.title(context),
                              style: isSelected
                                  ? TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    )
                                  : null,
                            ),
                          ],
                        )
                      : null,
                  icon: e.icon,
                  text: isDesktop ? '<' : e.title(context),
                  textStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                );
              }).toList(),
            );
          },
        ),
        if (isDesktop) const Divider(height: 0),
      ],
    );
  }

  Widget _pageContent(context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppConstants.maxPageWidth),
        child: Observer(builder: (context) => controller.currentPage.content),
      ),
    )
        .animate(onInit: (controller) {
          this.controller.pageAnimationController = controller;
        })
        .fade(duration: const Duration(milliseconds: 700))
        .flipV(duration: const Duration(milliseconds: 350));
  }
}
