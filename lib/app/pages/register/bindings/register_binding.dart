import 'package:get/get.dart';
import '/app/pages/register/controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
      fenix: true,
    );
  }
}
  