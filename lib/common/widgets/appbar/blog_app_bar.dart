import "package:blogs_system/core/configs/theme/app_colors.dart";
import "package:flutter/material.dart";

class BasicBlogAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isActionsTick;
  const BasicBlogAppBar({
    this.isActionsTick = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(
            Icons.arrow_back,
            size: 18,
            color: AppColors.whiteBackground,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
