import "package:blogs_system/core/error/failures.dart";
import "package:blogs_system/core/usecase/usecase.dart";
import "package:blogs_system/domain/auth/repository/auth.repository.dart";
import "package:fpdart/fpdart.dart";
import "package:supabase_flutter/supabase_flutter.dart" as sb;

class CurrentUser implements UseCase<sb.User, NoPrams> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, sb.User>> call(NoPrams params) async {
    return await authRepository.currentUser();
  }
}
