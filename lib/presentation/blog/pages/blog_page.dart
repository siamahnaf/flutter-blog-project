import "package:blogs_system/core/common/widgets/loader.dart";
import "package:blogs_system/core/utils/show_snackbar.dart";
import "package:blogs_system/presentation/blog/bloc/blog_bloc.dart";
import "package:blogs_system/presentation/blog/widgets/blog_appbar.dart";
import "package:blogs_system/presentation/blog/widgets/blog_card.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class BlogPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const BlogPage());

  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(BlogGetAllBlog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BlogAppBar(),
      body: BlocConsumer<BlogBloc, BlogState>(
        listener: (context, state) {
          if (state is BlogFailure) {
            showSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is BlogLoading) {
            return const Loader();
          } else if (state is BlogSuccess) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: state.blogs.length,
                itemBuilder: (context, index) {
                  final blog = state.blogs[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: BlogCard(blog: blog),
                  );
                },
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
