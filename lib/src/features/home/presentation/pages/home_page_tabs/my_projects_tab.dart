import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';

class MyProjectsTab extends StatelessWidget {
  const MyProjectsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            AppLocalizations.of(context)!.myProjects,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Row(children: [Text(AppLocalizations.of(context)!.adviseMessage)])
      ],
    );
  }
}
