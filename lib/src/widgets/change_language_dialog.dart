import 'package:eduardoazevedo/src/controllers/app_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../enums/supported_languages.dart';

class ChangeLanguageDialog extends StatelessWidget {
  late final AppController controller;
  ChangeLanguageDialog({super.key}) : controller = GetIt.I.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(16),
      title: Text(AppLocalizations.of(context)!.changeLanguage),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: SupportedLanguages.values.map((language) {
          final bool isSelected = language == controller.selectedLanguage ||
              (language == SupportedLanguages.system &&
                  controller.selectedLanguage == null);
          return InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              if (isSelected) {
                Navigator.of(context).pop();
              } else {
                controller.changeLanguage(language);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  language.icon,
                  const SizedBox(width: 16),
                  Text(language.title(context)),
                ],
              ),
            ),
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: Text(AppLocalizations.of(context)!.close),
        ),
      ],
    );
  }
}
