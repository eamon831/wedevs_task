import 'package:get/get.dart';
import '/app/pages/splash/bindings/splash_binding.dart';
import '/app/pages/splash/views/splash_views.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.splash;
  static final routes = [
    GetPage(
      name: _Paths.splash,
      page:()=> SplashViews(),
      binding: SplashBinding(),
    ),
  ];
}
