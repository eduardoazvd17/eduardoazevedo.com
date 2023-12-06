import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';

enum SupportedThemes {
  system,
  light,
  dark,
}

extension SupportedThemesExtension on SupportedThemes {
  Icon get icon {
    return switch (this) {
      SupportedThemes.system => const Icon(CupertinoIcons.settings),
      SupportedThemes.light => const Icon(
          CupertinoIcons.sun_max,
          color: Colors.orange,
        ),
      SupportedThemes.dark => Icon(
          CupertinoIcons.moon,
          color: Colors.purple[200],
        ),
    };
  }

  String title(BuildContext context) {
    return switch (this) {
      SupportedThemes.system => AppLocalizations.of(context)!.system,
      SupportedThemes.light => AppLocalizations.of(context)!.light,
      SupportedThemes.dark => AppLocalizations.of(context)!.dark,
    };
  }

  ThemeMode get themeMode {
    return switch (this) {
      SupportedThemes.system => ThemeMode.system,
      SupportedThemes.light => ThemeMode.light,
      SupportedThemes.dark => ThemeMode.dark,
    };
  }
}
