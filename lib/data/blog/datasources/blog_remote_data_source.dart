import "dart:io";

import "package:blogs_system/core/error/exceptions.dart";
import "package:blogs_system/data/blog/model/blog_input_model.dart";
import "package:blogs_system/data/blog/model/blog_model.dart";
import "package:supabase_flutter/supabase_flutter.dart";
import "package:nanoid/nanoid.dart";
import "package:path/path.dart" as path;

abstract interface class BlogRemoteDataSource {
  Future<List<BlogModel>> uploadBlog(BlogInputModel blogInput);
  Future<String> uploadBlogImage({
    required File file,
  });
  Future<List<BlogModel>> getAllBlogs();
}

class BlogRemoteDataSourceImp implements BlogRemoteDataSource {
  final SupabaseClient supabaseClient;

  BlogRemoteDataSourceImp(this.supabaseClient);

  @override
  Future<List<BlogModel>> uploadBlog(BlogInputModel blogInput) async {
    try {
      final response = await supabaseClient
          .from("blogs")
          .insert(blogInput.toJson())
          .select("*");
      return response.map((blog) => BlogModel.fromJson(blog)).toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadBlogImage({required File file}) async {
    final String ext = path.extension(file.path);
    final String fileKey = "image/${nanoid()}$ext";
    try {
      await supabaseClient.storage.from("blog_images").upload(
            fileKey,
            file,
          );
      return supabaseClient.storage.from("blog_images").getPublicUrl(fileKey);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<BlogModel>> getAllBlogs() async {
    try {
      final response = await supabaseClient.from("blogs").select("*");
      return response.map((blog) => BlogModel.fromJson(blog)).toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
