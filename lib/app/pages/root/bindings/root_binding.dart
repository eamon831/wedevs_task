import 'package:get/get.dart';

import '/app/pages/cart/controllers/cart_controller.dart';
import '/app/pages/category/controllers/category_controller.dart';
import '/app/pages/home/controllers/home_controller.dart';
import '/app/pages/product_search/controllers/product_search_controller.dart';
import '/app/pages/profile/controllers/profile_controller.dart';
import '/app/pages/root/controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<RootController>(
        RootController.new,
        fenix: true,
      )
      ..lazyPut<HomeController>(
        HomeController.new,
        fenix: true,
      )
      ..lazyPut<CategoryController>(
        CategoryController.new,
        fenix: true,
      )
      ..lazyPut<ProductSearchController>(
        ProductSearchController.new,
        fenix: true,
      )
      ..lazyPut<CartController>(
        CartController.new,
        fenix: true,
      )
      ..lazyPut<ProfileController>(
        ProfileController.new,
        fenix: true,
      );
  }
}
