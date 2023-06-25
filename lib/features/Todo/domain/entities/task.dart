class Task {
  final int id;
  final String title;
  final String description;
  final String image;
  final bool isDone;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.isDone,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
}
