import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
}
