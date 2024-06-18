import 'package:eduardoazevedo/src/widgets/responsive_builder.dart';
import 'package:eduardoazevedo/src/models/project_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../enums/project_reference_type.dart';

class ProjectWidget extends StatelessWidget {
  final ProjectModel project;
  const ProjectWidget({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobileWidget: _mobileWidget(context),
      desktopWidget: _desktopWidget(context),
    );
  }

  Widget _mobileWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 4,
                child: _projectImage,
              ),
              const SizedBox(width: 10),
              Flexible(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [_projectName],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: _projectDetails(context),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _desktopWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 4,
            child: _projectImage,
          ),
          const SizedBox(width: 10),
          Flexible(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  _projectName,
                  const Divider(),
                  _projectDetails(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _projectImage {
    final Image imageWidget = project.imageUrl.startsWith('assets/')
        ? Image.asset(project.imageUrl)
        : Image.network(project.imageUrl);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: AspectRatio(aspectRatio: 16 / 9, child: imageWidget),
    );
  }

  Widget get _projectName {
    return Text(
      project.name,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _projectDetails(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 20),
            child: Text(
              project.description,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Wrap(
            spacing: 25,
            runSpacing: 10,
            children: project.references.keys.map((reference) {
              return _referenceWidget(
                context: context,
                reference: reference,
                referenceUrl: project.references[reference]!,
              );
            }).toList(),
          ),
        ],
      );

  Widget _referenceWidget({
    required BuildContext context,
    required ProjectReferenceType reference,
    required String referenceUrl,
  }) {
    return InkWell(
      onTap: () async {
        late final String url;
        if (!referenceUrl.startsWith('http://') &&
            !referenceUrl.startsWith('https://')) {
          url = 'https://$referenceUrl';
        } else {
          url = referenceUrl;
        }

        if (await canLaunchUrlString(url)) {
          await launchUrlString(url);
        }
      },
      borderRadius: BorderRadius.circular(15),
      child: Tooltip(
        message: referenceUrl,
        child: Padding(
          padding: const EdgeInsets.all(2.5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(reference.icon),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  reference.title(context),
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
