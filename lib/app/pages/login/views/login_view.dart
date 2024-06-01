import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wedevs_task/app/core/values/text_styles.dart';
import 'package:wedevs_task/app/core/widget/text_form_field_widget.dart';

import '/app/core/base/base_view.dart';
import '/app/core/widget/asset_image_view.dart';
import '/app/pages/login/controllers/login_controller.dart';

//ignore: must_be_immutable
class LoginView extends BaseView<LoginController> {
  LoginView({super.key});

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
          child: Text('Login'),
        ),
      ],
    );
  }
}
