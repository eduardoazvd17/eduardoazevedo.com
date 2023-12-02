import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/cupertino.dart';

enum ProjectReferenceType {
  preview,
  repository,
  download,
}

extension ProjectReferenceTypeExtension on ProjectReferenceType {
  IconData get icon => switch (this) {
        ProjectReferenceType.preview => CupertinoIcons.globe,
        ProjectReferenceType.repository => CupertinoIcons.archivebox,
        ProjectReferenceType.download => CupertinoIcons.cloud_download,
      };

  String title(BuildContext context) => switch (this) {
        ProjectReferenceType.preview => AppLocalizations.of(context)!.preview,
        ProjectReferenceType.repository =>
          AppLocalizations.of(context)!.repository,
        ProjectReferenceType.download => AppLocalizations.of(context)!.download,
      };
}
