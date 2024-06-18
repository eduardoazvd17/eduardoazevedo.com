import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactTab extends StatefulWidget {
  const ContactTab({super.key});

  @override
  State<ContactTab> createState() => _ContactTabState();
}

class _ContactTabState extends State<ContactTab> {
  late final TextEditingController _subjectTextController;
  late final TextEditingController _messageTextController;

  @override
  void initState() {
    _subjectTextController = TextEditingController();
    _messageTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _subjectTextController.dispose();
    _messageTextController.dispose();
    super.dispose();
  }

  void _clearFields() {
    _subjectTextController.clear();
    _messageTextController.clear();
  }

  Future<void> _sendEmail() async {
    final String subject = _subjectTextController.text.trim();
    final String body = _messageTextController.text.trim();
    if (subject.isEmpty || body.isEmpty) return;

    final Uri uri = Uri(
      scheme: 'mailto',
      path: 'eduardoazvd17@gmail.com',
      query: 'subject=$subject&body=$body',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            AppLocalizations.of(context)!.contact,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Text(AppLocalizations.of(context)!.contactDescription),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Text(AppLocalizations.of(context)!.contactBy),
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
                borderRadius: BorderRadius.circular(15),
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
          padding: const EdgeInsets.only(bottom: 5),
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
            controller: _subjectTextController,
          ),
          _formTextField(
            label: AppLocalizations.of(context)!.message,
            controller: _messageTextController,
            isTextArea: true,
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: _formButton(
                  icon: Icons.close,
                  text: AppLocalizations.of(context)!.clearFields,
                  color: Theme.of(context).colorScheme.error,
                  onTap: _clearFields,
                ),
              ),
              Expanded(
                child: _formButton(
                  icon: Icons.send,
                  text: AppLocalizations.of(context)!.send,
                  color: Theme.of(context).colorScheme.secondary,
                  onTap: _sendEmail,
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
      child: TextFormField(
        controller: controller,
        maxLines: isTextArea ? 5 : 1,
        decoration: InputDecoration(
          prefixIcon: icon != null ? Icon(icon) : null,
          label: Text(label),
          border: const OutlineInputBorder(),
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
      borderRadius: BorderRadius.circular(15),
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
