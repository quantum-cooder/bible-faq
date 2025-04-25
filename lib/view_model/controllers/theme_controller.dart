import 'package:bible_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = (Get.isDarkMode).obs;

  void toggleTheme() {
    if (isDarkMode.value) {
      Get.changeTheme(ThemeData.light());
    } else {
      Get.changeTheme(ThemeData.dark());
    }
    isDarkMode.value = !isDarkMode.value;
    // Save the theme preference
    LocalStorageUtil.saveTheme(isDarkMode.value);
  }

  Future<void> loadThemePreference() async {
    // Load saved theme preference
    isDarkMode.value = await LocalStorageUtil.getTheme();

    // Apply the saved theme
    if (isDarkMode.value) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
  }

  ThemeMode getThemeMode() {
    return isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  void onInit() async {
    super.onInit();
    await loadThemePreference();
  }
}
