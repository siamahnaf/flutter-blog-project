import "dart:io";

import "package:blogs_system/core/error/exceptions.dart";
import "package:blogs_system/core/error/failures.dart";
import "package:blogs_system/data/blog/datasources/blog_remote_data_source.dart";
import "package:blogs_system/data/blog/model/blog_input_model.dart";
import "package:blogs_system/domain/blog/entities/blog.dart";
import "package:blogs_system/domain/blog/repositories/blog_repository.dart";
import "package:fpdart/fpdart.dart";

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDataSource blogRemoteDataSource;

  BlogRepositoryImpl(this.blogRemoteDataSource);

  @override
  Future<Either<Failure, List<Blog>>> uploadBlog({
    required File image,
    required String title,
    required String content,
    required String userId,
    required List<String> topics,
  }) async {
    try {
      final imageUrl = await blogRemoteDataSource.uploadBlogImage(file: image);
      BlogInputModel blogInput = BlogInputModel(
        title: title,
        content: content,
        image: imageUrl,
        topics: topics,
        userId: userId,
      );
      final response = await blogRemoteDataSource.uploadBlog(blogInput);
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Blog>>> getAllBlogs() async {
    try {
      final response = await blogRemoteDataSource.getAllBlogs();
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
