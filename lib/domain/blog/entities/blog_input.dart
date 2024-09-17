class BlogInput {
  final String title;
  final String content;
  final String image;
  final List<String> topics;
  final String userId;

  BlogInput({
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
    required this.userId,
  });
}
