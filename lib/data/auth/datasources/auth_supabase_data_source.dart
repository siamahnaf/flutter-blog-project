import "package:blogs_system/core/error/exceptions.dart";
import "package:supabase_flutter/supabase_flutter.dart" as sb;

abstract interface class AuthSupabaseDataSource {
  sb.Session? get currentUserSession;

  Future<sb.AuthResponse> registerAccount({
    required String name,
    required String email,
    required String password,
  });

  Future<sb.AuthResponse> loginAccount({
    required String email,
    required String password,
  });

  Future<sb.User?> getCurrentUserData();
}

class AuthSupabaseDataSourceImpl implements AuthSupabaseDataSource {
  final sb.SupabaseClient supabaseClient;

  AuthSupabaseDataSourceImpl(this.supabaseClient);

  @override
  sb.Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<sb.AuthResponse> loginAccount({
    required String email,
    required String password,
  }) {
    return _userAuth(
      () async => await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      ),
    );
  }

  @override
  Future<sb.AuthResponse> registerAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    return _userAuth(
      () async => await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {
          "name": name,
        },
      ),
    );
  }

  Future<sb.AuthResponse> _userAuth(
    Future<sb.AuthResponse> Function() fn,
  ) async {
    try {
      return await fn();
    } on sb.AuthException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<sb.User?> getCurrentUserData() async {
    try {
      if (currentUserSession != null) {
        final response = await supabaseClient.auth.getUser();
        if (response.user != null) {
          return response.user;
        }
        return null;
      }
      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
