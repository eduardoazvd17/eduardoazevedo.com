import 'package:flutter/material.dart';
import 'package:welcome/widgets/profile_widget.dart';

class HomePage extends StatelessWidget {
  static const String route = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileWidget(),
    );
  }
}
