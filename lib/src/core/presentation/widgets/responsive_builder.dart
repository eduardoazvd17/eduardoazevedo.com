import 'package:eduardoazevedo/src/core/data/utils/app_constants.dart';
import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget? desktopWidget;
  final Widget? mobileWidget;

  const ResponsiveBuilder({
    super.key,
    this.desktopWidget,
    this.mobileWidget,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= AppConstants.maxMobileWidth) {
          return desktopWidget ?? const SizedBox();
        } else {
          return mobileWidget ?? const SizedBox();
        }
      },
    );
  }
}
