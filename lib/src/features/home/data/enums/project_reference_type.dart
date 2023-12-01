import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/cupertino.dart';

enum ProjectReferenceType {
  preview,
  repository,
}

extension ProjectReferenceTypeExtension on ProjectReferenceType {
  IconData get icon => switch (this) {
        ProjectReferenceType.preview => CupertinoIcons.globe,
        ProjectReferenceType.repository => CupertinoIcons.archivebox,
      };

  String title(BuildContext context) => switch (this) {
        ProjectReferenceType.preview => AppLocalizations.of(context)!.preview,
        ProjectReferenceType.repository =>
          AppLocalizations.of(context)!.repository,
      };
}
