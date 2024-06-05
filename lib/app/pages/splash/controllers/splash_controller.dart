import 'package:get/get.dart';
import 'package:wedevs_task/app/session_manager/session_manager.dart';

import '/app/core/base/base_controller.dart';
import '/app/routes/app_pages.dart';

class SplashController extends BaseController {
  @override
  Future<void> onInit() async {
    super.onInit();
    await navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    await SessionManager().init();
    final isLoggedIn = await prefs.getIsLogin();
    if (isLoggedIn) {
      Get.offAllNamed(Routes.root);
    } else {
      Get.offAllNamed(Routes.signIn);
    }
  }
}
