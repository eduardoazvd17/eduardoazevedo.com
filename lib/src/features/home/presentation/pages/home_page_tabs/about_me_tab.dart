import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';

class AboutMeTab extends StatelessWidget {
  const AboutMeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            AppLocalizations.of(context)!.aboutMe,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
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
