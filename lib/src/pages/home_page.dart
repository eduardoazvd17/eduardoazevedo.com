import 'package:eduardoazevedo/src/utils/app_constants.dart';
import 'package:eduardoazevedo/src/controllers/app_controller.dart';
import 'package:eduardoazevedo/src/widgets/change_language_dialog.dart';
import 'package:eduardoazevedo/src/enums/home_page_tabs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../widgets/change_theme_dialog.dart';
import '../widgets/responsive_builder.dart';
import '../widgets/profile_widget.dart';
import 'home_page_tabs/about_me_tab.dart';
import 'home_page_tabs/contact_tab.dart';
import 'home_page_tabs/my_projects_tab.dart';

class HomePage extends StatefulWidget {
  final AppController appController;
  const HomePage({super.key, required this.appController});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _pageAnimationController;
  late final ScrollController _scrollController;
  HomePageTabs _currentPage = HomePageTabs.values.first;

  @override
  void initState() {
    _pageAnimationController = AnimationController(vsync: this);
    _scrollController = ScrollController(
      initialScrollOffset: widget.appController.homePageScrollPosition,
    );
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _pageAnimationController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    widget.appController.homePageScrollPosition = _scrollController.offset;
  }

  Future<void> _changePage(HomePageTabs newPage) async {
    if (_currentPage != newPage) {
      await _pageAnimationController.reverse();
      setState(() => _currentPage = newPage);
      await _pageAnimationController.forward(from: 0);
    }
  }

  void _backToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      widget.appController.homePageScrollPosition = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      desktopWidget: _desktopScaffold,
      mobileWidget: _mobileScaffold,
    );
  }

  Widget get _desktopScaffold {
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: _expandableFab(context, _scrollController),
      body: SafeArea(
        child: _scrollableView(
          controller: _scrollController,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 35),
                child: ProfileWidget(),
              ),
              _navigationBar(context, true),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 35, horizontal: 35),
                child: _pageContent(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _mobileScaffold {
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: _expandableFab(context, _scrollController),
      bottomNavigationBar: _navigationBar(context, false),
      body: SafeArea(
        child: _scrollableView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 35),
                child: ProfileWidget(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: _pageContent(context),
              ),
            ],
          ),
        ),
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
              selectedIndex: _currentPage.index,
              onTabChange: (index) => _changePage(
                HomePageTabs.values[index],
              ),
              tabBorderRadius: 16,
              color: Theme.of(context).iconTheme.color,
              activeColor: Theme.of(context).primaryColor,
              mainAxisAlignment: isDesktop
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.center,
              tabs: HomePageTabs.values.map((e) {
                final bool isSelected = _currentPage == e;
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
                  text: isDesktop ? '•' : e.title(context),
                  textStyle: TextStyle(
                    fontSize: isDesktop ? 20 : null,
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
          child: Observer(
            builder: (context) {
              return switch (_currentPage) {
                HomePageTabs.aboutMe => const AboutMeTab(),
                HomePageTabs.myProjects => const MyProjectsTab(),
                HomePageTabs.contact => const ContactTab(),
              };
            },
          ),
        ),
      )
          .animate(controller: _pageAnimationController)
          .fade(duration: const Duration(milliseconds: 300)),
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
          onPressed: () => showDialog(
            context: context,
            builder: (context) => ChangeThemeDialog(),
          ),
          tooltip: AppLocalizations.of(context)!.changeTheme,
          child: const Icon(Icons.light),
        ),
        FloatingActionButton.small(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => ChangeLanguageDialog(),
          ),
          tooltip: AppLocalizations.of(context)!.changeLanguage,
          child: const Icon(CupertinoIcons.globe),
        ),
        FloatingActionButton.small(
          onPressed: _backToTop,
          tooltip: AppLocalizations.of(context)!.backToTop,
          child: const Icon(Icons.arrow_upward),
        ),
      ],
    );
  }

  _scrollableView({
    required ScrollController controller,
    EdgeInsets? padding,
    required Widget child,
  }) {
    return Scrollbar(
      thickness: 4,
      thumbVisibility: true,
      controller: controller,
      child: SingleChildScrollView(
        controller: controller,
        padding: padding,
        child: child,
      ),
    );
  }
}
