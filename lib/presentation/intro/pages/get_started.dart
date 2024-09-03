import "package:blogs_system/common/widgets/button/basic_fill_button.dart";
import "package:blogs_system/common/widgets/button/basic_outline_button.dart";
import "package:blogs_system/core/configs/assets/app_images.dart";
import "package:blogs_system/core/configs/assets/app_vectors.dart";
import "package:blogs_system/presentation/auth/pages/login.dart";
import "package:blogs_system/presentation/auth/pages/register.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppImages.introBG),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const Spacer(),
                SvgPicture.asset(
                  AppVectors.logo,
                  width: 30,
                  height: 30,
                ),
                const SizedBox(height: 51),
                BasicFillButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const LoginPage()),
                    );
                  },
                  title: "Login",
                ),
                const SizedBox(height: 21),
                BasicOutlineButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const RegisterPage()),
                    );
                  },
                  title: "Register",
                ),
                const SizedBox(height: 21),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
