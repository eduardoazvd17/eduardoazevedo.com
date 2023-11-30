import 'package:flutter/material.dart';

class MyProjectsPage extends StatelessWidget {
  static const String route = '/myProjects';
  const MyProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('My projects'),
      ],
    );
  }
}
