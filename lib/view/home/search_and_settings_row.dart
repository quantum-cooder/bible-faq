import 'package:bible_app/components/componets.dart';
import 'package:bible_app/constants/constants.dart';
import 'package:bible_app/view_model/controllers/controllers.dart';
import 'package:bible_app/view_model/question_provider/question_provider_sql.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SearchAndSettingsRow extends StatelessWidget {
  SearchAndSettingsRow({super.key});

  final dbController = Get.find<QuestionsProviderSql>();
  final ThemeController themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          const Gap(3),
          Expanded(
            child: CustomTextField(
              hintText: "Search...",
              prefixIcon: Icon(Icons.search),
              maxLines: 1,
            ),
          ),
          const Gap(10),
          Card(
            elevation: 4,
            margin: EdgeInsets.zero,
            color: themeController.isDarkMode.value
                ? AppColors.lightBlack
                : AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            shadowColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.transparent
                : Colors.grey.withAlpha(128),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: IconButton(
                    onPressed: () {
                      Get.toNamed(AppRouts.settingScreen);
                    },
                    icon: const Icon(Icons.settings_outlined)),
              ),
            ),
          ),
          const Gap(3),
        ],
      ),
    );
  }
}
