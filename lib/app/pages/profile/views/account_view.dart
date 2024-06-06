import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wedevs_task/app/core/core_model/logged_user.dart';
import 'package:wedevs_task/app/core/widget/base_button.dart';

class AccountView extends StatelessWidget {
  AccountView({super.key});
  LoggedUser get user => LoggedUser();
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final streetAddressController = TextEditingController();
  final aptController = TextEditingController();
  final zipController = TextEditingController();
  AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _textFormField(
          controller: emailController,
          labelText: appLocalization.email,
          hintText: 'youremail@xmail.com',
        ),
        _textFormField(
          controller: fullNameController,
          labelText: appLocalization.fullName,
          hintText: 'William Bennett',
        ),
        _textFormField(
          controller: streetAddressController,
          labelText: appLocalization.streetAddress,
          hintText: '465 Nolan Causeway Suite 079',
        ),
        _textFormField(
          controller: aptController,
          labelText: appLocalization.apt,
          hintText: 'Unit 512',
        ),
        Row(
          children: [
            Expanded(
              child: _textFormField(
                controller: zipController,
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _textFormField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
  }) {
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
