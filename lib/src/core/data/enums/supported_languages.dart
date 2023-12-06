import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum SupportedLanguages {
  english,
  portuguese,
}

extension SupportedLanguagesExtension on SupportedLanguages {
  Widget get icon {
    return switch (this) {
      SupportedLanguages.english => const Text('EN'),
      SupportedLanguages.portuguese => const Text('PT'),
    };
  }

  String title(BuildContext context) {
    return switch (this) {
      SupportedLanguages.english => AppLocalizations.of(context)!.english,
      SupportedLanguages.portuguese => AppLocalizations.of(context)!.portuguese,
    };
  }

  Locale get locale {
    return switch (this) {
      SupportedLanguages.english => const Locale('en'),
      SupportedLanguages.portuguese => const Locale('pt'),
    };
  }
}
