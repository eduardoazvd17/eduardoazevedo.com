import 'package:eduardoazevedo/src/features/home/data/enums/project_reference_type.dart';
import 'package:eduardoazevedo/src/features/home/data/models/project_model.dart';
import 'package:eduardoazevedo/src/features/home/presentation/widgets/project_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';

class MyProjectsTab extends StatelessWidget {
  const MyProjectsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProjectModel> myProjects = [
      ProjectModel(
        name: AppLocalizations.of(context)!.myFinances,
        description: AppLocalizations.of(context)!.myFinancesDescription,
        imageUrl: 'assets/images/projects/my_finances.png',
        references: {
          ProjectReferenceType.preview: 'https://myfinancesbr.web.app/',
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
          children: myProjects.map((e) {
            return ProjectWidget(project: e);
          }).toList(),
        ),
      ],
    );
  }
}
