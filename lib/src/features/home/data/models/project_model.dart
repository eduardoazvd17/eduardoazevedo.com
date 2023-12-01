class ProjectModel {
  final String name;
  final String description;
  final List<String> imagesUrl;
  final String? url;
  final String? repositoryUrl;

  bool get hasImages => imagesUrl.isNotEmpty;

  bool get hasPreview => url != null;

  bool get isPrivate => repositoryUrl == null;

  ProjectModel({
    required this.name,
    required this.description,
    required this.imagesUrl,
    this.url,
    this.repositoryUrl,
  });
}
