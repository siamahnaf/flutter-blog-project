import "package:blogs_system/core/common/cubits/app_user/app_user_cubit.dart";
import "package:blogs_system/core/configs/theme/app_theme.dart";
import "package:blogs_system/init_dependencies.dart";
import "package:blogs_system/presentation/auth/bloc/auth_bloc.dart";
import "package:blogs_system/presentation/splash/pages/splash_page.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AppUserCubit>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthUser());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
    );
  }
}
