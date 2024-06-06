import 'dart:io';
import 'package:file_picker/file_picker.dart';
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
  final profilePic = Rx<File?>(null);

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> signUp() async {
    final username = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (!_validateInputs(username, email, password, confirmPassword)) return;

    await _registerUser(username, email, password);
  }

  bool _validateInputs(
      String username, String email, String password, String confirmPassword) {
    if (username.isEmpty) {
      _showErrorSnackbar('Please enter a username');
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      _showErrorSnackbar('Please enter a valid email');
      return false;
    }

    if (password.isEmpty) {
      _showErrorSnackbar('Please enter a password');
      return false;
    }

    if (password != confirmPassword) {
      _showErrorSnackbar('Passwords do not match');
      return false;
    }

    if (profilePic.value == null) {
      _showErrorSnackbar('Please select a profile picture');
      return false;
    }

    return true;
  }

  void _showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.TOP,
    );
  }

  Future<void> _registerUser(
    String username,
    String email,
    String password,
  ) async {
    await dataFetcher(
      () async {
        final isRegistered = await services.registerAndUploadProfilePicture(
          username,
          email,
          password,
          profilePic.value!,
        );
        if (isRegistered) {
          Get.offAllNamed(Routes.root);
        }
      },
    );
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

  Future<void> pickProfilePic() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      profilePic.value = File(result.files.single.path!);
    } else {
      logger.i('User canceled the picker');
    }
  }
}
