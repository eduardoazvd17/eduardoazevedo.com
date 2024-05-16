import 'package:eduardoazevedo/src/features/home/data/enums/project_reference_type.dart';
import 'package:eduardoazevedo/src/features/home/data/models/project_model.dart';
import 'package:eduardoazevedo/src/features/home/presentation/widgets/project_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';

class MyProjectsTab extends StatelessWidget {
  const MyProjectsTab({super.key});

  @override
  Widget build(BuildContext context) {
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
          children: _getProjects(context).map((e) {
            return ProjectWidget(project: e);
          }).toList(),
        ),
      ],
    );
  }
}

List<ProjectModel> _getProjects(BuildContext context) {
  return [
    ProjectModel(
      name: AppLocalizations.of(context)!.investHelper,
      description: AppLocalizations.of(context)!.investHelperDescription,
      imageUrl: 'assets/images/projects/investhelper.png',
      references: {},
    ),
    ProjectModel(
      name: AppLocalizations.of(context)!.audioTexter,
      description: AppLocalizations.of(context)!.audioTexterDescription,
      imageUrl: 'assets/images/projects/audiotexter.png',
      references: {
        ProjectReferenceType.repository:
            'https://github.com/eduardoazvd17/audiotexter',
      },
    ),
    ProjectModel(
      name: AppLocalizations.of(context)!.myFinances,
      description: AppLocalizations.of(context)!.myFinancesDescription,
      imageUrl: 'assets/images/projects/my_finances.png',
      references: {
        ProjectReferenceType.preview: 'https://myfinancesbr.web.app/',
      },
    ),
    ProjectModel(
      name: AppLocalizations.of(context)!.nutriUtils,
      description: AppLocalizations.of(context)!.nutriUtilsDescription,
      imageUrl: 'assets/images/projects/nutriutils.png',
      references: {
        ProjectReferenceType.preview: 'https://nutriutils.eduardoazevedo.com/',
      },
    ),
    ProjectModel(
      name: AppLocalizations.of(context)!.gitf,
      description: AppLocalizations.of(context)!.gitfDescription,
      imageUrl: 'assets/images/projects/gitf.png',
      references: {
        ProjectReferenceType.download:
            "https://github.com/eduardoazvd17/gitf/releases",
        ProjectReferenceType.repository:
            'https://github.com/eduardoazvd17/gitf',
      },
    ),
    ProjectModel(
      name: AppLocalizations.of(context)!.credentialsManager,
      description: AppLocalizations.of(context)!.credentialsManagerDescription,
      imageUrl: 'assets/images/projects/pub_dev.png',
      references: {
        ProjectReferenceType.preview:
            "https://pub.dev/packages/credentials_manager",
        ProjectReferenceType.repository:
            'https://github.com/eduardoazvd17/credentials_manager',
      },
    ),
    ProjectModel(
      name: AppLocalizations.of(context)!.simpleOverlay,
      description: AppLocalizations.of(context)!.simpleOverlayDescription,
      imageUrl: 'assets/images/projects/pub_dev.png',
      references: {
        ProjectReferenceType.preview: "https://pub.dev/packages/simple_overlay",
        ProjectReferenceType.repository:
            'https://github.com/eduardoazvd17/simple_overlay',
      },
    ),
    ProjectModel(
      name: AppLocalizations.of(context)!.pokedex,
      description: AppLocalizations.of(context)!.pokedexDescription,
      imageUrl: 'assets/images/projects/pokedex.png',
      references: {
        ProjectReferenceType.repository:
            'https://github.com/eduardoazvd17/pokedex',
      },
    ),
    ProjectModel(
      name: AppLocalizations.of(context)!.flutterBook,
      description: AppLocalizations.of(context)!.flutterBookDescription,
      imageUrl: 'assets/images/projects/flutter_book.png',
      references: {
        ProjectReferenceType.repository:
            'https://github.com/eduardoazvd17/flutter_book',
      },
    ),
    ProjectModel(
      name: AppLocalizations.of(context)!.notesApp,
      description: AppLocalizations.of(context)!.notesAppDescription,
      imageUrl: 'assets/images/projects/notes_app.png',
      references: {
        ProjectReferenceType.repository:
            'https://github.com/eduardoazvd17/notes_app',
      },
    ),
    ProjectModel(
      name: AppLocalizations.of(context)!.moviesChallenge,
      description: AppLocalizations.of(context)!.moviesChallengeDescription,
      imageUrl: 'assets/images/projects/movies_challenge.png',
      references: {
        ProjectReferenceType.repository:
            'https://github.com/eduardoazvd17/movies_challenge',
      },
    ),
  ];
}
