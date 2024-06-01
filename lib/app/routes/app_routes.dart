part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const signIn = _Paths.signIn;
  static const signUp = _Paths.signUp;
  static const root = _Paths.root;
  static const home = _Paths.home;
  static const category = _Paths.category;
  static const productSearch = _Paths.productSearch;
  static const cart = _Paths.cart;
  static const profile = _Paths.profile;
}

abstract class _Paths {
  static const splash = '/splash';
  static const signIn = '/sign_in';
  static const signUp = '/sign_up';
  static const root = '/root';
  static const home = '/home';
  static const category = '/category';
  static const productSearch = '/product_search';
  static const cart = '/cart';
  static const profile = '/profile';
}
