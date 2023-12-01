import 'package:eduardoazevedo/src/features/home/data/models/project_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../data/enums/project_reference_type.dart';

class ProjectWidget extends StatelessWidget {
  final ProjectModel project;
  const ProjectWidget({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(child: _projectImages),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: _projectDetails(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _projectImages => AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
        )
            .animate(onPlay: (c) => c.repeat())
            .shimmer(delay: const Duration(milliseconds: 750)),
      );

  Widget _projectDetails(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
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
      borderRadius: BorderRadius.circular(5),
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
