import "package:blogs_system/core/common/cubits/app_user/app_user_cubit.dart";
import "package:blogs_system/core/usecase/usecase.dart";
import "package:blogs_system/domain/auth/usecases/current_user.dart";
import "package:blogs_system/domain/auth/usecases/user_login.dart";
import "package:blogs_system/domain/auth/usecases/user_register.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:supabase_flutter/supabase_flutter.dart" as sb;

part "auth_event.dart";
part "auth_state.dart";

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRegister _userRegister;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;

  AuthBloc({
    required UserRegister userRegister,
    required UserLogin userLogin,
    required CurrentUser currentUser,
    required AppUserCubit AppUserCubit,
  })  : _userRegister = userRegister,
        _userLogin = userLogin,
        _currentUser = currentUser,
        _appUserCubit = AppUserCubit,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthRegister>(_onAuthRegister);
    on<AuthLogin>(_onAuthLogin);
    on<AuthUser>(_onCurrentUser);
  }

  void _onAuthRegister(AuthRegister event, Emitter<AuthState> emit) async {
    final response = await _userRegister(RegisterParams(
      name: event.name,
      password: event.password,
      email: event.email,
    ));
    response.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) {
        _emitAuthSuccess(r.user, emit);
        emit(AuthSuccess(r));
      },
    );
  }

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    final response = await _userLogin(
      LoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    response.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) {
        _emitAuthSuccess(r.user, emit);
        emit(AuthSuccess(r));
      },
    );
  }

  void _onCurrentUser(AuthUser event, Emitter<AuthState> emit) async {
    final response = await _currentUser(NoPrams());
    response.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) {
        _emitAuthSuccess(r, emit);
        emit(AuthUserSuccess(r));
      },
    );
  }

  void _emitAuthSuccess(sb.User? user, Emitter<AuthState> emit) {
    _appUserCubit.updateUser(user);
  }
}
