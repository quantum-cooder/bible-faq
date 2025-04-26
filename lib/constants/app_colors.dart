import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/controllers/controllers.dart';

class AppColors {
  static const Color aquaBlue = Color(0xFF58E4F5);
  static const Color tealBlue = Color(0xFF17A2B8);

  static const Color whiteBlue = Color(0xffedfcff);
  static const Color scaffoldLightColor = Color(0xfff6fbfc);
  static const Color scaffoldDarkColor = Color(0xff000318);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color lightBlack = Color(0xFF1B1E25);
  static const Color navyBlue = Color(0xFF0d162a);
  static const Color darkGray = Color(0xff7C7C7C);
  static const Color lightGray = Color(0xffA2A2A2);

  static const Color transparent = Colors.transparent;

  static Color getScaffoldBgColor() {
    final ThemeController themeController = Get.find<ThemeController>();
    return themeController.isDarkMode.value
        ? AppColors.lightBlack
        : AppColors.tealBlue;
  }
}
