import "package:blogs_system/domain/blog/entities/blog.dart";

class BlogModel extends Blog {
  BlogModel({
    required super.title,
    required super.content,
    required super.image,
    required super.topics,
    required super.userId,
  });
}
