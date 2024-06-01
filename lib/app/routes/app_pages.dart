import 'package:get/get.dart';

import '/app/pages/cart/bindings/cart_binding.dart';
import '/app/pages/cart/views/cart_view.dart';
import '/app/pages/category/bindings/category_binding.dart';
import '/app/pages/category/views/category_view.dart';
import '/app/pages/home/bindings/home_binding.dart';
import '/app/pages/home/views/home_view.dart';
import '/app/pages/login/bindings/login_binding.dart';
import '/app/pages/login/views/login_view.dart';
import '/app/pages/product_search/bindings/product_search_binding.dart';
import '/app/pages/product_search/views/product_search_view.dart';
import '/app/pages/profile/bindings/profile_binding.dart';
import '/app/pages/profile/views/profile_view.dart';
import '/app/pages/register/bindings/register_binding.dart';
import '/app/pages/register/views/register_view.dart';
import '/app/pages/splash/bindings/splash_binding.dart';
import '/app/pages/splash/views/splash_views.dart';
import '/app/pages/root/bindings/root_binding.dart';
import '/app/pages/root/views/root_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.splash;
  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => SplashViews(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.root,
      page: () => RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.category,
      page: () => CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: Routes.productSearch,
      page: () => ProductSearchView(),
      binding: ProductSearchBinding(),
    ),
    GetPage(
      name: Routes.cart,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
