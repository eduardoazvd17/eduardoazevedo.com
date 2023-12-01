import '../enums/project_reference_type.dart';

class ProjectModel {
  final String name;
  final String description;
  final List<String> images;
  final Map<ProjectReferenceType, String> references;

  ProjectModel({
    required this.name,
    required this.description,
    required this.images,
    required this.references,
  });
}
