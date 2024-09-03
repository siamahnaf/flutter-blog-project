import "package:blogs_system/core/configs/theme/app_colors.dart";
import "package:flutter/material.dart";

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.whiteBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.greyBorder,
              width: 1,
            ),
          ),
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
