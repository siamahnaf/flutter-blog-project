import "package:blogs_system/common/widgets/appbar/blog_app_bar.dart";
import "package:blogs_system/core/configs/theme/app_colors.dart";
import "package:blogs_system/domain/blog/entities/blog.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

class BlogViewerPage extends StatelessWidget {
  static route(Blog blog) =>
      MaterialPageRoute(builder: (context) => BlogViewerPage(blog: blog));

  final Blog blog;

  const BlogViewerPage({
    super.key,
    required this.blog,
  });

  @override
  Widget build(BuildContext context) {
    String formatDate(String isoDate) {
      DateTime dateTime = DateTime.parse(isoDate);
      return DateFormat("d MMMM, yyyy — h:mm a").format(dateTime);
    }

    return Scaffold(
      appBar: const BasicBlogAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(blog.image!),
            ),
            const SizedBox(height: 13),
            Text(
              blog.topics!.first.toUpperCase(),
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppColors.primary.withOpacity(0.48),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              blog.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              formatDate(blog.createdAt),
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            const Divider(
              color: AppColors.greyDivided,
              thickness: 1,
              height: 20,
            ),
            const SizedBox(height: 16),
            Text(
              blog.content,
              style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
