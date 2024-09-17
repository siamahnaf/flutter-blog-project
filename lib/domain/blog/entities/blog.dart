class Blog {
  final String id;
  final String title;
  final String content;
  final String? image;
  final List<String>? topics;
  final String? userId;
  final String createdAt;

  Blog({
    required this.id,
    required this.title,
    required this.content,
    this.image,
    this.topics,
    this.userId,
    required this.createdAt,
  });
}
