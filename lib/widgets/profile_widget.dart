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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _profilePicture(context),
        const SizedBox(width: 15),
        _profileData(context),
      ],
    );
  }

  Widget _profilePicture(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: ClipOval(
          child: Image.asset(
            'assets/images/me.jpeg',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    ).animate().flipH();
  }

  Widget _profileData(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Eduardo Azevedo Regueira',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              AppLocalizations.of(context)!.profileTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => _open(
                  'https://www.linkedin.com/in/eduardoazvd17/',
                ),
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Image.network(
                    'assets/icons/linkedin.png',
                    color: Colors.blueAccent,
                    width: 90,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              InkWell(
                onTap: () => _open(
                  'https://github.com/eduardoazvd17/',
                ),
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Image.network(
                    'assets/icons/github.png',
                    width: 90,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate().fade().slideX();
  }

  Future<void> _open(String url) async {
    try {
      if (await canLaunchUrlString(url)) {
        launchUrlString(url);
      }
    } catch (_) {}
  }
}
