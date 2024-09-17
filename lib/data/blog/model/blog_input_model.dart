import "package:blogs_system/domain/blog/entities/blog_input.dart";

class BlogInputModel extends BlogInput {
  BlogInputModel({
    required super.title,
    required super.content,
    required super.image,
    required super.topics,
    required super.userId,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "title": title,
      "content": content,
      "image": image,
      "topics": topics,
      "user_id": userId,
    };
  }
}
