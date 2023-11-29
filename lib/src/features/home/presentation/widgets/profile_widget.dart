import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth >= 768) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _profilePicture(context),
                  const SizedBox(width: 15),
                  Flexible(child: _profileData(context)),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _profilePicture(context),
                  const SizedBox(height: 15),
                  _profileData(
                    context,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ],
              );
            }
          }),
        ),
      ],
    );
  }

  Widget _profilePicture(BuildContext context) {
    return Card(
      elevation: 8,
      shape: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: ClipOval(
          child: Image.asset(
            'assets/images/me.jpeg',
            fit: BoxFit.fitHeight,
            height: 160,
          ),
        ).animate().flipH(),
      ),
    );
  }

  Widget _profileData(
    BuildContext context, {
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) {
    final TextAlign textAlign = crossAxisAlignment == CrossAxisAlignment.center
        ? TextAlign.center
        : TextAlign.start;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Text(
              'Eduardo Azevedo Regueira',
              textAlign: textAlign,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                AppLocalizations.of(context)!.profileTitle,
                textAlign: textAlign,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ).animate().fade().slideX(),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            InkWell(
              onTap: () => _open(
                'https://www.linkedin.com/in/eduardoazvd17/',
              ),
              borderRadius: BorderRadius.circular(5),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Image.asset(
                  'assets/icons/linkedin.png',
                  color: Colors.blueAccent,
                  width: 90,
                ),
              ),
            ),
            InkWell(
              onTap: () => _open(
                'https://github.com/eduardoazvd17/',
              ),
              borderRadius: BorderRadius.circular(5),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Image.asset(
                  'assets/icons/github.png',
                  width: 90,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ],
        ).animate().fade().slideY(),
      ],
    );
  }

  Future<void> _open(String url) async {
    try {
      if (await canLaunchUrlString(url)) {
        launchUrlString(url);
      }
    } catch (_) {}
  }
}
