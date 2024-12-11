class Project {
  final String name;
  final String description;
  final List<Map<String, String>> tags;
  final String image;
  final String sourceCodeLink;

  Project({
    required this.name,
    required this.description,
    required this.tags,
    required this.image,
    required this.sourceCodeLink,
  });
}
