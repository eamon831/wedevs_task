import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '/app/core/base/base_view.dart';
import '/app/core/values/text_styles.dart';
import '/app/core/widget/asset_image_view.dart';
import '/app/core/widget/base_button.dart';
import '/app/core/widget/text_form_field_widget.dart';
import '/app/pages/sign_in/controllers/sign_in_controller.dart';

//ignore: must_be_immutable
class SignInView extends BaseView<SignInController> {
  SignInView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 33,
        right: 33,
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          83.height,
          const Center(
            child: AssetImageView(
              fileName: 'app_logo.svg',
            ),
          ),
          83.height,
          Center(
            child: Text(
              appLocalization.signIn,
              style: titleStyle,
            ),
          ),
          41.height,
          TextFormFieldWidget(
            controller: controller.userNameController,
            hintText: appLocalization.email,
            validator: noValidator,
            prefix: 'ic_email.svg',
          ),
          19.height,
          Obx(
            () {
              return TextFormFieldWidget(
                controller: controller.passwordController,
                hintText: appLocalization.password,
                validator: noValidator,
                obscureText: !controller.showPassword.value,
                prefix: 'ic_password.svg',
                suffix: IconButton(
                  icon: Icon(
                    controller.showPassword.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: const Color(0xFFA9AFC7),
                  ),
                  onPressed: controller.showPassword.toggle,
                ),
              );
            },
          ),
          18.height,
          InkWell(
            onTap: controller.onTapForgotPassword,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                appLocalization.forgotPassword,
                style: const TextStyle(),
              ),
            ),
          ),
          60.height,
          BaseButton(
            buttonText: appLocalization.login,
            onPressed: controller.login,
          ),
          40.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: controller.signInWithFacebook,
                child: const AssetImageView(
                  fileName: 'ic_facebook.svg',
                ),
              ),
              14.width,
              InkWell(
                onTap: controller.signInWithGoogle,
                child: const AssetImageView(
                  fileName: 'ic_google.svg',
                ),
              ),
            ],
          ),
          52.height,
          Center(
            child: GestureDetector(
              onTap: controller.navigateToSignUp,
              child: Text(
                appLocalization.createNewAccount,
                style: const TextStyle(
                  color: Color(0xFF383C40),
                  fontSize: 17.36,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
