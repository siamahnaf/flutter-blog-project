import "package:blogs_system/core/error/failures.dart";
import "package:blogs_system/core/usecase/usecase.dart";
import "package:blogs_system/domain/blog/entities/blog.dart";
import "package:blogs_system/domain/blog/repositories/blog_repository.dart";
import "package:fpdart/fpdart.dart";

class GetAllBlog implements UseCase<List<Blog>, NoPrams> {
  final BlogRepository blogRepository;
  GetAllBlog(this.blogRepository);
  @override
  Future<Either<Failure, List<Blog>>> call(NoPrams params) async {
    return await blogRepository.getAllBlogs();
  }
}
