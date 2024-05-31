import 'package:get/get.dart';
import 'package:wedevs_task/app/pages/splash/views/splash_views.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.splash;
  static final routes = [
    GetPage(
      name: _Paths.splash,
      page:()=> SplashViews(),
    ),
  ];
}
