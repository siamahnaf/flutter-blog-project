part of "auth_bloc.dart";

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final sb.AuthResponse authResponse;

  const AuthSuccess(this.authResponse);
}

final class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);
}

final class AuthUserSuccess extends AuthState {
  final sb.User user;

  const AuthUserSuccess(this.user);
}
