import 'package:get/get.dart';
import '/app/pages/root/controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
      fenix: true,
    );
  }
}
  