import 'package:eduardoazevedo/src/core/presentation/controllers/app_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../data/enums/supported_themes.dart';
import '../../data/utils/app_themes.dart';

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
          final bool isSelected = theme == controller.selectedTheme;
          return InkWell(
            borderRadius: AppThemes.circular5,
            onTap: () {
              if (isSelected) {
                Navigator.of(context).pop();
              } else {
                controller.changeTheme(theme);
              }
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
