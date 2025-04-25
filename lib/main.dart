import 'package:bible_app/components/app_light_theme.dart';
import 'package:bible_app/components/componets.dart';
import 'package:bible_app/constants/constants.dart';
import 'package:bible_app/routes/routes.dart';
import 'package:bible_app/view_model/controllers/controllers.dart';
import 'package:bible_app/view_model/font_size_provider.dart';
import 'package:bible_app/view_model/question_provider/question_provider_sql.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetX controllers
  Get.put(ThemeController());
  Get.put(QuestionsProviderSql());
  Get.put(FontSizeController());

  // Use the recommended approach instead of window
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const BibleFAQ(),
    ),
  );
}

class BibleFAQ extends StatelessWidget {
  const BibleFAQ({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Obx(() => GetMaterialApp(
          title: 'Bible FAQ',
          defaultTransition: Transition.cupertino,
          theme: AppLightTheme.lightTheme,
          darkTheme: AppDarkTheme.darkTheme,
          themeMode: themeController.getThemeMode(),
          debugShowCheckedModeBanner: false,
          getPages: Routes.getAppRoutes(),
          initialRoute: AppRouts.splashScreen,
          // Add this builder to control the text scaling
          builder: (context, child) {
            // Get the mediaQuery data from the current context
            final mediaQueryData = MediaQuery.of(context);

            // Apply the fixed text scaling
            final fixedTextScale = MediaQuery(
              data: mediaQueryData.copyWith(
                textScaler: const TextScaler.linear(1.0),
              ),
              child: child!,
            );

            return fixedTextScale;
          },
        ));
  }
}
