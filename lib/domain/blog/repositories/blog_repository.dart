import "dart:io";

import "package:blogs_system/core/error/failures.dart";
import "package:blogs_system/domain/blog/entities/blog.dart";
import "package:fpdart/fpdart.dart";

abstract interface class BlogRepository {
  Future<Either<Failure, List<Blog>>> uploadBlog({
    required File image,
    required String title,
    required String content,
    required String userId,
    required List<String> topics,
  });

  Future<Either<Failure, List<Blog>>> getAllBlogs();
}
