import "package:blogs_system/core/configs/assets/app_vectors.dart";
import "package:blogs_system/presentation/intro/pages/get_started.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AppVectors.logo,
          width: 40,
          height: 40,
        ),
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const GetStartedPage(),
      ),
    );
  }
}
