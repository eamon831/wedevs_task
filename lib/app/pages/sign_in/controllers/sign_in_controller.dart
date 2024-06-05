import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '/app/core/base/base_controller.dart';
import '/app/routes/app_pages.dart';

class SignInController extends BaseController {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final showPassword = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> login() async {
    final userName = userNameController.text;
    final password = passwordController.text;

    if (userName.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter a valid userName',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (password.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter a password',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final isLoggedIn = await services.authenticateUser(
      username: userName,
      password: password,
    );
    if (isLoggedIn != null) {
      Get.offNamed(Routes.root);
    } else {
      Get.snackbar(
        'Error',
        'Invalid userName or password',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void navigateToSignUp() {
    Get.toNamed(Routes.signUp);
  }

  void signInWithFacebook() {
    toast(appLocalization.underDevelopment);
  }

  void signInWithGoogle() {
    toast(appLocalization.underDevelopment);
  }

  void onTapForgotPassword() {
    toast(appLocalization.underDevelopment);
  }
}
