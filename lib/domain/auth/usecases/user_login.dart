import "package:blogs_system/core/error/failures.dart";
import "package:blogs_system/core/usecase/usecase.dart";
import "package:blogs_system/domain/auth/repository/auth.repository.dart";
import "package:fpdart/fpdart.dart";
import "package:supabase_flutter/supabase_flutter.dart";

class UserLogin implements UseCase<AuthResponse, LoginParams> {
  final AuthRepository authRepository;

  const UserLogin(this.authRepository);

  @override
  Future<Either<Failure, AuthResponse>> call(LoginParams params) async {
    return authRepository.loginAccount(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams {
  final String email;
  final String password;
  LoginParams({
    required this.email,
    required this.password,
  });
}
