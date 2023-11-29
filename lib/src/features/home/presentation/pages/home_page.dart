import 'package:eduardoazevedo/src/features/home/data/enums/home_page_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/profile_widget.dart';

class HomePage extends StatelessWidget {
  static const String route = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 768) {
          return _desktopScaffold(context);
        } else {
          return _mobileScaffold(context);
        }
      },
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

  Widget _bottomNavigationBar(BuildContext context) => BottomNavigationBar(
        onTap: (index) {},
        items: HomePageTabs.values.map((e) {
          return BottomNavigationBarItem(
            icon: Icon(e.icon),
            label: e.title(context),
          );
        }).toList(),
      ).animate().fade();

  Widget _navigationBar(BuildContext context) => Column(
        children: [
          const Divider(height: 0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: HomePageTabs.values.map((e) {
                return InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(5),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(e.icon),
                        const SizedBox(width: 10),
                        Text(e.title(context)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const Divider(height: 0),
        ],
      ).animate().fade();

  Widget _pageContent(context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.adviseMessage),
        ],
      ).animate().fade();
}
