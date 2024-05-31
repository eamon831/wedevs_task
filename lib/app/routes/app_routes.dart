part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const register = _Paths.register;
  static const main = _Paths.main;
}

abstract class _Paths {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const main = '/main';
}
