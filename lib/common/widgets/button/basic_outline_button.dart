import "package:blogs_system/core/configs/theme/app_colors.dart";
import "package:flutter/material.dart";

class BasicOutlineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;

  const BasicOutlineButton({
    required this.onPressed,
    required this.title,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 60),
        side: const BorderSide(
          color: AppColors.primary,
          width: 1,
        ),
      ),
      child: Text(title),
    );
  }
}
