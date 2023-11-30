import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  static const String route = '/aboutMe';
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('About me'),
      ],
    );
  }
}
