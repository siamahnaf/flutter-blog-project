// import "package:blogs_system/core/error/exceptions.dart";
// import "package:blogs_system/data/blog/model/blog_model.dart";
// import "package:supabase_flutter/supabase_flutter.dart";

// abstract interface class BlogRemoteDataSource {
//   Future<BlogModel> uploadBlog(BlogModel blog);
// }

// class BlogRemoteDataSourceImp implements BlogRemoteDataSource {
//   final SupabaseClient supabaseClient;

//   BlogRemoteDataSourceImp(this.supabaseClient);

//   @override
//   Future<BlogModel> uploadBlog(BlogModel blog) {
//     try {
//       final response = supabaseClient.from("blogs").insert()
//     } catch (e) {
//       throw ServerException(e.toString());
//     }
//   }
// }
