import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';

class ContactTab extends StatelessWidget {
  const ContactTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            AppLocalizations.of(context)!.contact,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Row(children: [Text(AppLocalizations.of(context)!.contactDescription)]),
        _emailForm(context),
      ],
    );
  }

  Widget _emailForm(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(),
          TextField(),
          TextField(),
        ],
      ),
    );
  }
}
