import 'package:eduardoazevedo/src/core/presentation/controllers/app_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../data/enums/supported_languages.dart';
import '../../data/enums/supported_themes.dart';
import '../../data/utils/app_themes.dart';

class SettingsDialog extends StatelessWidget {
  late final AppController controller;
  SettingsDialog({super.key}) : controller = GetIt.I.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.settings),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _themeSelectionWidget(context),
          _languageSelectionWidget(context),
        ],
      ),
    );
  }

  Widget _themeSelectionWidget(BuildContext context) {
    return Observer(
      builder: (_) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppLocalizations.of(context)!.theme),
            const SizedBox(width: 10),
            DropdownButton<SupportedThemes>(
              borderRadius: AppThemes.circular5,
              value: controller.selectedTheme,
              onChanged: controller.changeTheme,
              items: SupportedThemes.values.map((e) {
                return DropdownMenuItem(value: e, child: e.icon);
              }).toList(),
            ),
          ],
        );
      },
    );
  }

  Widget _languageSelectionWidget(BuildContext context) {
    return Observer(
      builder: (_) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppLocalizations.of(context)!.language),
            const SizedBox(width: 10),
            DropdownButton<SupportedLanguages?>(
              borderRadius: AppThemes.circular5,
              value: controller.selectedLanguage,
              hint: const Text('...'),
              items: SupportedLanguages.values.map((e) {
                return DropdownMenuItem(value: e, child: e.icon);
              }).toList(),
              onChanged: controller.changeLanguage,
            ),
          ],
        );
      },
    );
  }
}
