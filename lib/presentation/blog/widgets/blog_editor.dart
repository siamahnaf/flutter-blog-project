import "package:flutter/material.dart";

class BlogEditor extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int? minLines;
  final int? maxLines;
  const BlogEditor({
    super.key,
    required this.controller,
    required this.hintText,
    this.minLines,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      minLines: minLines,
      maxLines: maxLines,
    );
  }
}
