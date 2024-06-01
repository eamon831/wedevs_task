import 'package:get/get.dart';
import '/app/pages/cart/controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
      () => CartController(),
      fenix: true,
    );
  }
}
  