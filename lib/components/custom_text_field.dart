import 'package:bible_app/constants/app_colors.dart';
import 'package:bible_app/constants/app_routs.dart';
import 'package:bible_app/view_model/controllers/controllers.dart';
import 'package:bible_app/view_model/question_provider/question_provider_sql.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.hintText = "Search",
    this.prefixIcon = const Icon(Icons.search),
    this.maxLines = 1,
    this.height = 50,
    this.isFavQuestionSearchBar = false,
  });
  final String hintText;
  final Widget prefixIcon;
  final int maxLines;
  final double height;
  final bool isFavQuestionSearchBar;
  final ThemeController themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    final dbController = Get.find<QuestionsProviderSql>();
    dbController.allQuestions;

    return Card(
      elevation: 4,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.transparent
          : Colors.grey.withAlpha(128),
      child: SizedBox(
        height: height,
        child: TextFormField(
          onTap: () {
            isFavQuestionSearchBar
                ? Get.toNamed(AppRouts.favQuestionSearchScreen)
                : Get.toNamed(AppRouts.searchQusetionScreen);
          },
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: themeController.isDarkMode.value
                ? AppColors.lightBlack
                : AppColors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            hintStyle: context.theme.inputDecorationTheme.hintStyle,
            contentPadding: const EdgeInsets.symmetric(vertical: 13),
          ),
          maxLines: maxLines,
        ),
      ),
    );
  }
}
