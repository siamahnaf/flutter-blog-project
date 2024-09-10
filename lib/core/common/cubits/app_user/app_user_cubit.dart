import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:supabase_flutter/supabase_flutter.dart";
import "package:supabase_flutter/supabase_flutter.dart" as sb;
part "app_user_state.dart";

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());

  void updateUser(sb.User? user) {
    if (user == null) {
      emit(AppUserInitial());
    } else {
      emit(AppUserLoggedIn(user));
    }
  }
}
