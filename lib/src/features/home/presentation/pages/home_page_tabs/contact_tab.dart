import 'package:eduardoazevedo/src/features/home/presentation/controllers/contact_tab_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/data/utils/app_themes.dart';

class ContactTab extends StatelessWidget {
  final ContactTabController controller;
  const ContactTab({
    super.key,
    required this.controller,
  });

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
        Text(AppLocalizations.of(context)!.contactDescription),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Text(AppLocalizations.of(context)!.contactBy),
              const SizedBox(width: 10),
              InkWell(
                onTap: () async {
                  try {
                    Uri uri = Uri.parse('whatsapp://send?phone=+5521988542950');
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      uri = Uri.parse('https://wa.me/+5521988542950');
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
                    }
                  } catch (_) {}
                },
                borderRadius: AppThemes.circular5,
                child: Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: Image.asset(
                    'assets/icons/whatsapp.png',
                    width: 100,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(AppLocalizations.of(context)!.sendMeEmail),
        ),
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
          _formTextField(
            label: AppLocalizations.of(context)!.subject,
            controller: controller.subjectTextController,
          ),
          _formTextField(
            label: AppLocalizations.of(context)!.message,
            controller: controller.messageTextController,
            isTextArea: true,
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: _formButton(
                  icon: Icons.close,
                  text: AppLocalizations.of(context)!.clearFields,
                  color: AppThemes.errorColor,
                  onTap: controller.clearContactFields,
                ),
              ),
              Expanded(
                child: _formButton(
                  icon: Icons.send,
                  text: AppLocalizations.of(context)!.send,
                  color: AppThemes.accentColor,
                  onTap: controller.sendEmail,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _formTextField({
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

  Widget _formButton({
    required IconData icon,
    required String text,
    required Color color,
    required void Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppThemes.circular5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 30),
            Text(text, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }
}
