import 'package:get/get.dart';
import 'package:wedevs_task/app/core/core_model/logged_user.dart';
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
    // currently using shared preferences
    // but we can also do online validation here
    // get user data from shared preferences
    // call the authenticateUser method from services.dart
    if (isLoggedIn) {
      final user = await prefs.getUser();
      if (user.isNotEmpty) {
        LoggedUser.fromJson(user);
        Get.offAllNamed(Routes.root);
      }
    } else {
      Get.offAllNamed(Routes.signIn);
    }
  }
}
