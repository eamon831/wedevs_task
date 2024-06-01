import 'package:get/get.dart';
import '/app/pages/product_search/controllers/product_search_controller.dart';

class ProductSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductSearchController>(
      () => ProductSearchController(),
      fenix: true,
    );
  }
}
  