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
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Text(AppLocalizations.of(context)!.presentationText),
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
