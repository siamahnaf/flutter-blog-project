import "package:blogs_system/core/configs/assets/app_vectors.dart";
import "package:blogs_system/core/configs/theme/app_colors.dart";
import "package:blogs_system/presentation/blog/pages/add_new_blog_page.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

class BlogAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BlogAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: SvgPicture.asset(
        AppVectors.logo,
        width: 20,
        height: 20,
      ),
      leading: IconButton(
        onPressed: () {},
        icon: Container(
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(100),
          ),
          child: SvgPicture.asset(
            AppVectors.menus,
            width: 10,
            height: 10,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const AddNewBlogPage(),
              ),
            );
          },
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: AppColors.primary,
                width: 2,
              ),
            ),
            child: const Icon(
              CupertinoIcons.add,
              size: 20,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
