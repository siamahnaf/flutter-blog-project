import "package:blogs_system/core/error/failures.dart";
import "package:fpdart/fpdart.dart";
import "package:supabase_flutter/supabase_flutter.dart" as sb;

abstract interface class AuthRepository {
  Future<Either<Failure, sb.AuthResponse>> registerAccount({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, sb.AuthResponse>> loginAccount({
    required String email,
    required String password,
  });

  Future<Either<Failure, sb.User>> currentUser();
}
