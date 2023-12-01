import 'package:eduardoazevedo/src/features/home/data/enums/project_reference_type.dart';
import 'package:eduardoazevedo/src/features/home/data/models/project_model.dart';
import 'package:eduardoazevedo/src/features/home/presentation/widgets/project_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';

class MyProjectsTab extends StatelessWidget {
  const MyProjectsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final projectsMock = [
      ProjectModel(
        name: 'Testing title 1',
        description: 'Testing description 2',
        imageUrl: 'assets/icons/linkedin.png',
        references: {
          ProjectReferenceType.preview: 'google.com',
        },
      ),
      ProjectModel(
        name: 'Testing title 2',
        description: 'Testing description 2',
        imageUrl: 'assets/icons/flutter.png',
        references: {
          ProjectReferenceType.preview: 'https://eduardoazevedo.com',
          ProjectReferenceType.repository:
              'https://github.com/eduardoazvd17/eduardoazevedo.com',
        },
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            AppLocalizations.of(context)!.myProjects,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: projectsMock.map((e) {
            return ProjectWidget(project: e);
          }).toList(),
        ),
      ],
    );
  }
}
