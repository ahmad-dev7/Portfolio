class ProjectModel {
  final String title;
  final String subtitle;
  final String description;
  final String image;
  final String sourceUrl;
  final List<String> tags;

  ProjectModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.sourceUrl,
    required this.tags,
  });
}
