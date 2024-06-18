import 'package:eduardoazevedo/src/controllers/app_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../enums/supported_themes.dart';

class ChangeThemeDialog extends StatelessWidget {
  late final AppController controller;
  ChangeThemeDialog({super.key}) : controller = GetIt.I.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(16),
      title: Text(AppLocalizations.of(context)!.changeTheme),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: SupportedThemes.values.map((theme) {
          return InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              controller.changeTheme(theme);
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  theme.icon,
                  const SizedBox(width: 16),
                  Text(theme.title(context)),
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
