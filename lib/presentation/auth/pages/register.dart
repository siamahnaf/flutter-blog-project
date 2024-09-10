import "package:blogs_system/common/widgets/appbar/app_bar.dart";
import "package:blogs_system/common/widgets/button/basic_fill_button.dart";
import "package:blogs_system/core/common/widgets/loader.dart";
import "package:blogs_system/core/configs/theme/app_colors.dart";
import "package:blogs_system/core/utils/show_snackbar.dart";
import "package:blogs_system/presentation/auth/bloc/auth_bloc.dart";
import "package:blogs_system/presentation/auth/pages/login.dart";
import "package:blogs_system/presentation/auth/widgets/auth_field.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Loader();
            }
            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    _registerText(),
                    const SizedBox(height: 40),
                    AuthField(
                      hintText: "Full Name",
                      controller: usernameController,
                    ),
                    const SizedBox(height: 21),
                    AuthField(
                      hintText: "Email",
                      controller: emailController,
                    ),
                    const SizedBox(height: 21),
                    AuthField(
                      hintText: "Password",
                      controller: passwordController,
                      isObscureText: true,
                    ),
                    const SizedBox(height: 21),
                    BasicFillButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthRegister(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                name: usernameController.text.trim(),
                              ),
                            );
                      },
                      title: "Register",
                      height: 65,
                    ),
                    const SizedBox(height: 21),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const LoginPage(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 17),
                          children: [
                            TextSpan(
                              text: "Login Now",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: AppColors.main, fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      "Hello! Register to get started",
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 35,
        color: AppColors.primary,
      ),
      textAlign: TextAlign.left,
    );
  }
}
