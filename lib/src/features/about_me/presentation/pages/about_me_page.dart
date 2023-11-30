import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  static const String route = '/aboutMe';
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.aboutMe,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 20),
        Text(AppLocalizations.of(context)!.apresentationText1),
        const SizedBox(height: 10),
        Text(AppLocalizations.of(context)!.apresentationText2),
        const SizedBox(height: 10),
        Text(AppLocalizations.of(context)!.apresentationText3),
        const SizedBox(height: 10),
        Text(AppLocalizations.of(context)!.apresentationText4),
      ],
    );
  }
}
