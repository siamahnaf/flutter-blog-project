import "package:blogs_system/core/error/exceptions.dart";
import "package:blogs_system/core/error/failures.dart";
import "package:blogs_system/data/auth/datasources/auth_supabase_data_source.dart";
import "package:blogs_system/domain/auth/repository/auth.repository.dart";
import "package:fpdart/fpdart.dart";
import "package:supabase_flutter/supabase_flutter.dart" as sb;

class AuthRepositoryImpl implements AuthRepository {
  final AuthSupabaseDataSource supabaseDataSource;
  AuthRepositoryImpl(this.supabaseDataSource);

  @override
  Future<Either<Failure, sb.User>> currentUser() async {
    try {
      final response = await supabaseDataSource.getCurrentUserData();
      if (response == null) {
        return left(Failure("Please login to your account"));
      }
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, sb.AuthResponse>> loginAccount({
    required String email,
    required String password,
  }) async {
    return _userAuth(
      () async => await supabaseDataSource.loginAccount(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, sb.AuthResponse>> registerAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    return _userAuth(
      () async => await supabaseDataSource.registerAccount(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  Future<Either<Failure, sb.AuthResponse>> _userAuth(
    Future<sb.AuthResponse> Function() fn,
  ) async {
    try {
      final response = await fn();
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
