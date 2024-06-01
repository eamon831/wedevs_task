import 'package:get/get.dart';
import '/app/pages/sign_in/controllers/sign_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController(),
      fenix: true,
    );
  }
}
  