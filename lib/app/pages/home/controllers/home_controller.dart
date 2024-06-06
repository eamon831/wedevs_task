import 'package:get/get.dart';
import 'package:wedevs_task/app/routes/app_pages.dart';
  import '/app/core/base/base_controller.dart';
  
class HomeController extends BaseController {
 @override
  Future<void> onInit() async {
    super.onInit();
  }


  void restartApp() {
    Get.offNamed(Routes.splash);
  }
}
  