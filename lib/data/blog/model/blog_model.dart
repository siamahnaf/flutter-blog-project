import "package:blogs_system/domain/blog/entities/blog.dart";

class BlogModel extends Blog {
  BlogModel({
    required super.id,
    required super.title,
    required super.content,
    super.image,
    super.topics,
    super.userId,
    required super.createdAt,
  });

  factory BlogModel.fromJson(Map<String, dynamic> map) {
    return BlogModel(
      id: map["id"] as String,
      title: map["title"] as String,
      content: map["content"] as String,
      image: map["image"] as String,
      topics: List<String>.from(map["topics"] ?? []),
      userId: map["user_id"] as String,
      createdAt: map["created_at"] as String,
    );
  }
}
