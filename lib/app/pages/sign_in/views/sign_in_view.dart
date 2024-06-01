import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '/app/core/base/base_view.dart';
import '/app/core/values/text_styles.dart';
import '/app/core/widget/asset_image_view.dart';
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
    return Column(
      children: [
        83.height,
        const Center(
          child: AssetImageView(
            fileName: 'app_logo.svg',
          ),
        ),
        83.height,
        Text(
          appLocalization.signIn,
          style: titleStyle,
        ),
        41.height,
        TextFormFieldWidget(
          controller: controller.emailController,
          hintText: appLocalization.email,
          validator: emailValidator,
        ),
        ElevatedButton(
          onPressed: controller.login,
          child: const Text('sign in'),
        ),
      ],
    );
  }
}
