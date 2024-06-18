import '../enums/project_reference_type.dart';

class ProjectModel {
  final String name;
  final String description;
  final String imageUrl;
  final Map<ProjectReferenceType, String> references;

  ProjectModel({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.references,
  });
}
