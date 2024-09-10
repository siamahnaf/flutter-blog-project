import "package:blogs_system/core/error/failures.dart";
import "package:blogs_system/core/usecase/usecase.dart";
import "package:blogs_system/domain/auth/repository/auth.repository.dart";
import "package:fpdart/fpdart.dart";
import "package:supabase_flutter/supabase_flutter.dart";

class UserRegister implements UseCase<AuthResponse, RegisterParams> {
  final AuthRepository authRepository;

  const UserRegister(this.authRepository);

  @override
  Future<Either<Failure, AuthResponse>> call(RegisterParams params) async {
    return await authRepository.registerAccount(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class RegisterParams {
  final String name;
  final String password;
  final String email;
  RegisterParams({
    required this.name,
    required this.password,
    required this.email,
  });
}
