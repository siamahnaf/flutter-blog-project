import "package:blogs_system/core/configs/theme/app_colors.dart";
import "package:flutter/material.dart";

class BasicFillButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  const BasicFillButton({
    required this.onPressed,
    required this.title,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style:
          ElevatedButton.styleFrom(minimumSize: Size.fromHeight(height ?? 60)),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.whiteBackground,
        ),
      ),
    );
  }
}
