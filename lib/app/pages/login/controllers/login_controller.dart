import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';
import '/app/routes/app_pages.dart';

class LoginController extends BaseController {
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void login() {
    Get.offNamed(Routes.root);
  }
}
