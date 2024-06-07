import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wedevs_task/app/core/base/base_view.dart';
import 'package:wedevs_task/app/core/widget/base_button.dart';

import 'account_view_controller.dart';

class AccountView extends BaseView<AccountViewController> {
  AccountView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color pageBackgroundColor() {
    return Colors.white;
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        ProfileTextFromField(
          controller: controller.emailController,
          labelText: appLocalization.email,
          hintText: 'youremail@xmail.com',
        ),
        ProfileTextFromField(
          controller: controller.firstNameController,
          labelText: appLocalization.firstName,
          hintText: 'William',
        ),
        ProfileTextFromField(
          controller: controller.lastNameController,
          labelText: appLocalization.lastName,
          hintText: 'Bennett',
        ),
        ProfileTextFromField(
          controller: controller.streetAddressController,
          labelText: appLocalization.streetAddress,
          hintText: '465 Nolan Causeway Suite 079',
        ),
        ProfileTextFromField(
          controller: controller.aptController,
          labelText: appLocalization.apt,
          hintText: 'Unit 512',
        ),
        Row(
          children: [
            Expanded(
              child: ProfileTextFromField(
                controller: controller.zipController,
                labelText: appLocalization.zipCode,
                hintText: '77017',
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ],
        ),
        24.height,
        Row(
          children: [
            Expanded(
              child: BaseButton(
                buttonText: appLocalization.cancel,
                height: 50,
                width: 135,
                bgColor: Colors.transparent,
                borderColor: const Color(0xFFbababa),
                customButtonTextStyle: GoogleFonts.lato(
                  fontSize: 17.36,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF607374),
                ),
                onPressed: () {},
              ),
            ),
            20.width,
            Expanded(
              child: BaseButton(
                buttonText: appLocalization.save,
                height: 50,
                width: 135,
                bgColor: const Color(0xFF1ABC9C),
                customButtonTextStyle: GoogleFonts.roboto(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFFFFFFF),
                ),
                onPressed: controller.updateProfile,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  const ProfileTextFromField({
    required this.controller,
    required this.labelText,
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        24.height,
        Text(
          labelText,
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF858c90),
          ),
        ),
        12.height,
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 19,
              vertical: 16,
            ),
            hintStyle: GoogleFonts.roboto(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF858c90),
            ),
            border: outlineInputBorder(),
            focusedBorder: outlineInputBorder(),
            enabledBorder: outlineInputBorder(),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color(0xFFe5e6e7),
      ),
    );
  }
}
