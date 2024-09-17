import "dart:io";

import "package:blogs_system/core/error/failures.dart";
import "package:blogs_system/core/usecase/usecase.dart";
import "package:blogs_system/domain/blog/entities/blog.dart";
import "package:blogs_system/domain/blog/repositories/blog_repository.dart";
import "package:fpdart/fpdart.dart";

class UploadBlog implements UseCase<List<Blog>, UploadBlogPrams> {
  final BlogRepository blogRepository;
  UploadBlog(this.blogRepository);

  @override
  Future<Either<Failure, List<Blog>>> call(UploadBlogPrams params) async {
    return await blogRepository.uploadBlog(
      image: params.image,
      title: params.title,
      content: params.content,
      userId: params.userId,
      topics: params.topics,
    );
  }
}

class UploadBlogPrams {
  final String userId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;

  UploadBlogPrams({
    required this.userId,
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
  });
}
