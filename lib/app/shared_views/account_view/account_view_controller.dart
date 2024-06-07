import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wedevs_task/app/core/base/base_controller.dart';

class AccountViewController extends BaseController {
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final streetAddressController = TextEditingController();
  final aptController = TextEditingController();
  final zipController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    if (await prefs.getIsLogin()) {
      emailController.text = loggedUser.userEmail ?? '';
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    streetAddressController.dispose();
    aptController.dispose();
    zipController.dispose();
    super.dispose();
  }

  Future<void> updateProfile() async {
    await dataFetcher(
      () async {
        final isUpdated = await services.updateProfile(
          email: null,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          streetAddress: null,
          apt: null,
          zip: null,
        );
        if (isUpdated) {
           toast('Profile updated successfully');
        }
      },
    );
  }
}
