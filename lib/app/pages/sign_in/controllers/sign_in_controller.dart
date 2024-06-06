import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '/app/core/base/base_controller.dart';
import '/app/routes/app_pages.dart';

class SignInController extends BaseController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool showPassword = false.obs;

  // String constants for error messages
  static const String errorTitle = 'Error';
  static const String emptyUsernameError = 'Please enter a valid username';
  static const String emptyPasswordError = 'Please enter a password';
  static const String invalidCredentialsError = 'Invalid username or password';

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> login() async {
    final String userName = userNameController.text.trim();
    final String password = passwordController.text.trim();

    if (userName.isEmpty) {
      _showErrorSnackbar(emptyUsernameError);
      return;
    }

    if (password.isEmpty) {
      _showErrorSnackbar(emptyPasswordError);
      return;
    }

    try {
      await dataFetcher(
        () async {
          final isLoggedIn = await services.authenticateUser(
            username: userName,
            password: password,
          );

          if (isLoggedIn) {
            Get.offAllNamed(Routes.root);
          } else {
            _showErrorSnackbar(invalidCredentialsError);
          }
        },
      );
    } on Exception catch (e) {
      _showErrorSnackbar(e.toString());
    }
  }

  void _showErrorSnackbar(String message) {
    Get.snackbar(
      errorTitle,
      message,
      snackPosition: SnackPosition.TOP,
    );
  }

  void navigateToSignUp() {
    Get.toNamed(Routes.signUp);
  }

  void signInWithFacebook() {
    _showUnderDevelopmentToast();
  }

  void signInWithGoogle() {
    _showUnderDevelopmentToast();
  }

  void onTapForgotPassword() {
    _showUnderDevelopmentToast();
  }

  void _showUnderDevelopmentToast() {
    toast(appLocalization.underDevelopment);
  }
}
