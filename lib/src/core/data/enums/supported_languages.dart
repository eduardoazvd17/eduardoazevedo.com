import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum SupportedLanguages {
  system,
  english,
  portuguese,
}

extension SupportedLanguagesExtension on SupportedLanguages {
  Widget get icon {
    return switch (this) {
      SupportedLanguages.system => const Icon(CupertinoIcons.settings),
      SupportedLanguages.english => Image.asset(
          'assets/icons/languages/en.png',
          width: 24,
        ),
      SupportedLanguages.portuguese => Image.asset(
          'assets/icons/languages/pt.png',
          width: 24,
        ),
    };
  }

  String title(BuildContext context) {
    return switch (this) {
      SupportedLanguages.system => AppLocalizations.of(context)!.system,
      SupportedLanguages.english => AppLocalizations.of(context)!.english,
      SupportedLanguages.portuguese => AppLocalizations.of(context)!.portuguese,
    };
  }

  Locale? get locale {
    return switch (this) {
      SupportedLanguages.system => null,
      SupportedLanguages.english => const Locale('en'),
      SupportedLanguages.portuguese => const Locale('pt'),
    };
  }
}
