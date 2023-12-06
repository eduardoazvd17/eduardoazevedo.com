import 'package:eduardoazevedo/src/core/data/utils/app_constants.dart';
import 'package:eduardoazevedo/src/core/presentation/widgets/change_language_dialog.dart';
import 'package:eduardoazevedo/src/features/home/data/enums/home_page_tabs.dart';
import 'package:eduardoazevedo/src/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../core/presentation/widgets/change_theme_dialog.dart';
import '../../../../core/presentation/widgets/responsive_builder.dart';
import '../widgets/profile_widget.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;
  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController(
      initialScrollOffset: controller.scrollPosition,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.addListener(() {
        controller.scrollPosition = scrollController.offset;
      });
    });

    return ResponsiveBuilder(
      desktopWidget: _desktopScaffold(context, scrollController),
      mobileWidget: _mobileScaffold(context, scrollController),
    );
  }

  Widget _desktopScaffold(
    BuildContext context,
    ScrollController scrollController,
  ) {
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: _expandableFab(context, scrollController),
      body: ListView(
        controller: scrollController,
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

  Widget _mobileScaffold(
    BuildContext context,
    ScrollController scrollController,
  ) {
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: _expandableFab(context, scrollController),
      bottomNavigationBar: _navigationBar(context, false),
      body: ListView(
        controller: scrollController,
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppConstants.maxPageWidth),
          child: Observer(builder: (context) => controller.currentPage.content),
        ),
      )
          .animate(onInit: (controller) {
            this.controller.pageAnimationController = controller;
          })
          .fade(duration: const Duration(milliseconds: 700))
          .flipV(duration: const Duration(milliseconds: 350)),
    );
  }

  Widget _expandableFab(
    BuildContext context,
    ScrollController scrollController,
  ) {
    return ExpandableFab(
      duration: const Duration(milliseconds: 300),
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        fabSize: ExpandableFabSize.regular,
        child: const Icon(Icons.menu),
      ),
      closeButtonBuilder: DefaultFloatingActionButtonBuilder(
        fabSize: ExpandableFabSize.regular,
        child: const Icon(Icons.close),
      ),
      children: [
        FloatingActionButton.small(
          tooltip: AppLocalizations.of(context)!.changeTheme,
          child: const Icon(Icons.light),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => ChangeThemeDialog(),
            );
          },
        ),
        FloatingActionButton.small(
          tooltip: AppLocalizations.of(context)!.changeLanguage,
          child: const Icon(CupertinoIcons.globe),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => ChangeLanguageDialog(),
            );
          },
        ),
        FloatingActionButton.small(
          tooltip: AppLocalizations.of(context)!.backToTop,
          child: const Icon(Icons.arrow_upward),
          onPressed: () {
            if (scrollController.hasClients) {
              scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            } else {
              controller.scrollPosition = 0;
            }
          },
        ),
      ],
    );
  }
}
