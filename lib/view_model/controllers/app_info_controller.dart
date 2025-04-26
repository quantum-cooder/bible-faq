import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfoController extends GetxController {
  final RxString appVersion = ''.obs;
  final RxString buildNumber = ''.obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _getAppInfo();
  }

  Future<void> _getAppInfo() async {
    try {
      isLoading.value = true;
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      appVersion.value = packageInfo.version;
      buildNumber.value = packageInfo.buildNumber;
    } catch (e) {
      appVersion.value = 'Unknown';
      buildNumber.value = 'Unknown';
    } finally {
      isLoading.value = false;
    }
  }

  // Method to refresh app info when needed
  Future<void> refreshAppInfo() async {
    await _getAppInfo();
  }
}
