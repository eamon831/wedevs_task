import 'package:flutter/material.dart';
import 'package:wedevs_task/app/core/base/base_controller.dart';

class AccountViewController extends BaseController {
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final streetAddressController = TextEditingController();
  final aptController = TextEditingController();
  final zipController = TextEditingController();

  Future<void> updateProfile() async {
    await dataFetcher(
      () async {
        print('updateProfile');
        await services.updateProfile(
          email: emailController.text,
          fullName: fullNameController.text,
          streetAddress: streetAddressController.text,
          apt: aptController.text,
          zip: zipController.text,
        );
      },
    );
  }
}
