import "package:blogs_system/presentation/blog/widgets/blog_appbar.dart";
import "package:flutter/material.dart";

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BlogAppBar(),
      body: Center(
        child: Text("Hello Blog"),
      ),
    );
  }
}
