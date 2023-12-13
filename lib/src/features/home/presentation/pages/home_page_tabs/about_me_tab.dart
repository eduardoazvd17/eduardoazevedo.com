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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: _languagesIconsWidget(),
        ),
      ],
    );
  }

  Widget _languagesIconsWidget() {
    const icons = [
      'flutter.png',
      'csharp.png',
      'java.png',
      'javascript.png',
      'python.png'
    ];

    return Row(
      children: [
        Expanded(
          child: Wrap(
            spacing: 15,
            runSpacing: 15,
            alignment: WrapAlignment.spaceEvenly,
            runAlignment: WrapAlignment.spaceEvenly,
            children: icons.map((icon) {
              final String name = icon.replaceAll('.png', '');
              return Tooltip(
                message: name,
                child: Image.asset(
                  'assets/icons/$icon',
                  height: 50,
                  semanticLabel: name,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
