part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const register = _Paths.register;
  static const root = _Paths.root;
  static const home = _Paths.home;
  static const category = _Paths.category;
  static const productSearch = _Paths.productSearch;
  static const cart = _Paths.cart;
  static const profile = _Paths.profile;
}

abstract class _Paths {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const root = '/root';
  static const home = '/home';
  static const category = '/category';
  static const productSearch = '/product_search';
  static const cart = '/cart';
  static const profile = '/profile';
}
