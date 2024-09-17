import "dart:io";
import "package:blogs_system/core/usecase/usecase.dart";
import "package:blogs_system/domain/blog/entities/blog.dart";
import "package:blogs_system/domain/blog/usecase/get_all_blog.dart";
import "package:blogs_system/domain/blog/usecase/upload_blog.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

part "blog_event.dart";
part "blog_state.dart";

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog _uploadBlog;
  final GetAllBlog _getAllBlog;

  BlogBloc({
    required UploadBlog uploadBlog,
    required GetAllBlog getAllBlog,
  })  : _uploadBlog = uploadBlog,
        _getAllBlog = getAllBlog,
        super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(BlogLoading()));
    on<BlogUpload>(_onBlogUpload);
    on<BlogGetAllBlog>(_onGetAllBlog);
  }

  void _onBlogUpload(BlogUpload event, Emitter<BlogState> emit) async {
    final response = await _uploadBlog(
      UploadBlogPrams(
        userId: event.userId,
        title: event.title,
        content: event.content,
        image: event.image,
        topics: event.topics,
      ),
    );
    response.fold(
      (l) => emit(BlogFailure(l.message)),
      (r) => emit(BlogUploadSuccess()),
    );
  }

  void _onGetAllBlog(BlogGetAllBlog event, Emitter<BlogState> emit) async {
    final response = await _getAllBlog(NoPrams());
    response.fold(
      (l) => emit(BlogFailure(l.message)),
      (r) => emit(BlogSuccess(r)),
    );
  }
}
