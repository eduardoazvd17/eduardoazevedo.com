import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';

import '../../../../../core/data/utils/app_themes.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textField(
            icon: Icons.person,
            label: 'Nome',
            controller: TextEditingController(),
          ),
          _textField(
            icon: Icons.mail,
            label: 'E-mail',
            controller: TextEditingController(),
          ),
          _textField(
            //icon: Icons.message,
            label: 'Mensagem',
            controller: TextEditingController(),
            isTextArea: true,
          ),
        ],
      ),
    );
  }

  Widget _textField({
    IconData? icon,
    required String label,
    required TextEditingController controller,
    bool isTextArea = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppThemes.commonColor),
          borderRadius: AppThemes.circular5,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: TextField(
            maxLines: isTextArea ? 5 : 1,
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: icon != null ? Icon(icon) : null,
              label: Text(label),
            ),
          ),
        ),
      ),
    );
  }
}
