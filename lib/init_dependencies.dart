import "package:blogs_system/core/common/cubits/app_user/app_user_cubit.dart";
import "package:blogs_system/core/secrets/app_secrets.dart";
import "package:blogs_system/data/auth/datasources/auth_supabase_data_source.dart";
import "package:blogs_system/data/auth/repositories/auth_repository_impl.dart";
import "package:blogs_system/domain/auth/repository/auth.repository.dart";
import "package:blogs_system/domain/auth/usecases/current_user.dart";
import "package:blogs_system/domain/auth/usecases/user_login.dart";
import "package:blogs_system/domain/auth/usecases/user_register.dart";
import "package:blogs_system/presentation/auth/bloc/auth_bloc.dart";
import "package:get_it/get_it.dart";
import "package:supabase_flutter/supabase_flutter.dart";

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);

  //core
  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthSupabaseDataSource>(
      () => AuthSupabaseDataSourceImpl(
        serviceLocator<SupabaseClient>(),
      ),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserRegister(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserLogin(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => CurrentUser(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => AuthBloc(
        userRegister: serviceLocator(),
        userLogin: serviceLocator(),
        currentUser: serviceLocator(),
        AppUserCubit: serviceLocator(),
      ),
    );
}