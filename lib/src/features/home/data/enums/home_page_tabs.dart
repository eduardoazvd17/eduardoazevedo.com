import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../presentation/pages/home_page_tabs/about_me_tab.dart';
import '../../presentation/pages/home_page_tabs/contact_tab.dart';
import '../../presentation/pages/home_page_tabs/my_projects_tab.dart';

enum HomePageTabs {
  aboutMe,
  myProjects,
  contact,
}

extension HomePageTabsExtension on HomePageTabs {
  IconData get icon {
    return switch (this) {
      HomePageTabs.aboutMe => CupertinoIcons.info_circle,
      HomePageTabs.myProjects => CupertinoIcons.cube_box,
      HomePageTabs.contact => Icons.call_outlined,
    };
  }

  String title(BuildContext context) {
    return switch (this) {
      HomePageTabs.aboutMe => AppLocalizations.of(context)!.aboutMe,
      HomePageTabs.myProjects => AppLocalizations.of(context)!.myProjects,
      HomePageTabs.contact => AppLocalizations.of(context)!.contact,
    };
  }

  Widget get tab {
    return switch (this) {
      HomePageTabs.aboutMe => const AboutMeTab(),
      HomePageTabs.myProjects => const MyProjectsTab(),
      HomePageTabs.contact => const ContactTab(),
    };
  }
}
