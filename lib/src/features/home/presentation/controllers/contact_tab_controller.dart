import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';
part 'contact_tab_controller.g.dart';

class ContactTabController = ContactTabControllerBase
    with _$ContactTabController;

abstract class ContactTabControllerBase with Store {
  final TextEditingController subjectTextController = TextEditingController();
  final TextEditingController messageTextController = TextEditingController();

  void clearContactFields() {
    subjectTextController.clear();
    messageTextController.clear();
  }

  Future<bool> sendEmail() async {
    final String subject = subjectTextController.text.trim();
    final String body = messageTextController.text.trim();
    if (subject.isEmpty && body.isEmpty) return false;

    final Uri uri = Uri(
      scheme: 'mailto',
      path: 'eduardoazvd17@gmail.com',
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
      return true;
    } else {
      return false;
    }
  }
}
