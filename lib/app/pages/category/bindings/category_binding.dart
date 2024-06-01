import 'package:get/get.dart';
import '/app/pages/category/controllers/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
      fenix: true,
    );
  }
}
  