import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '/app/core/base/base_controller.dart';
import '/app/routes/app_pages.dart';

class SignUpController extends BaseController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final showPassword = false.obs;
  final showConfirmPassword = false.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void login() {
    final email = emailController.text;
    final password = passwordController.text;

    if (!GetUtils.isEmail(email)) {
      Get.snackbar(
        'Error',
        'Please enter a valid email',
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

    Get.offNamed(Routes.root);
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
