import "dart:io";
import "package:blogs_system/common/widgets/appbar/blog_app_bar.dart";
import "package:blogs_system/common/widgets/button/basic_fill_button.dart";
import "package:blogs_system/core/configs/theme/app_colors.dart";
import "package:blogs_system/core/utils/pick_image.dart";
import "package:blogs_system/presentation/blog/widgets/blog_editor.dart";
import "package:dotted_border/dotted_border.dart";
import "package:flutter/material.dart";

class AddNewBlogPage extends StatefulWidget {
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  List<String> selectedTopics = [];
  File? image;

  void selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicBlogAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              image != null
                  ? GestureDetector(
                      onTap: selectImage,
                      child: SizedBox(
                        width: double.infinity,
                        height: 160,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        selectImage();
                      },
                      child: DottedBorder(
                        color: AppColors.grey,
                        dashPattern: const [10, 4],
                        radius: const Radius.circular(10),
                        borderType: BorderType.RRect,
                        strokeCap: StrokeCap.round,
                        child: const SizedBox(
                          height: 160,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.folder_open,
                                size: 40,
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Select your image",
                                style: TextStyle(
                                    fontSize: 16, color: AppColors.primary),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    "Technology",
                    "Business",
                    "Programming",
                    "Entertainment",
                    "National",
                    "International"
                  ]
                      .asMap()
                      .entries
                      .map(
                        (e) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: (e.key == 0 || e.key == 5) ? 0 : 10),
                          child: GestureDetector(
                            onTap: () {
                              if (selectedTopics.contains(e.value)) {
                                selectedTopics.remove(e.value);
                              } else {
                                selectedTopics.add(e.value);
                              }
                              setState(() {});
                            },
                            child: Chip(
                              label: Text(
                                e.value,
                                style: TextStyle(
                                    color: selectedTopics.contains(e.value)
                                        ? AppColors.whiteBackground
                                        : AppColors.primary),
                              ),
                              color: selectedTopics.contains(e.value)
                                  ? const WidgetStatePropertyAll(
                                      AppColors.main,
                                    )
                                  : const WidgetStatePropertyAll(
                                      AppColors.whiteBackground,
                                    ),
                              side: BorderSide(
                                color: selectedTopics.contains(e.value)
                                    ? AppColors.main
                                    : AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 21),
              BlogEditor(
                controller: titleController,
                hintText: "Blog title",
                minLines: 1,
                maxLines: 2,
              ),
              const SizedBox(height: 21),
              BlogEditor(
                controller: contentController,
                hintText: "Description",
                minLines: 6,
                maxLines: null,
              ),
              const SizedBox(height: 21),
              BasicFillButton(
                onPressed: () {},
                title: "Add Blog",
                height: 65,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
