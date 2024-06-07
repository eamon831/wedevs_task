import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wedevs_task/app/core/values/app_assets.dart';
import '/app/core/base/base_view.dart';
import '/app/core/widget/asset_image_view.dart';
import '/app/core/widget/base_button.dart';
import '/app/core/widget/text_form_field_widget.dart';
import '/app/pages/sign_up/controllers/sign_up_controller.dart';

//ignore: must_be_immutable
class SignUpView extends BaseView<SignUpController> {
  SignUpView({super.key});

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
          52.height,
          Stack(
            children: [
              Obx(
                () {
                  return (controller.profilePic.value?.path.isNotEmpty ?? false)
                      ? Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.white,
                            ),
                            height: 121,
                            width: 121,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.file(
                                controller.profilePic.value!,
                                height: 100,
                                width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  color: Colors.white,
                                ),
                                height: 121,
                                width: 121,
                                child: const Center(
                                  child: SizedBox(
                                    height: 26,
                                    width: 26,
                                    child: AssetImageView(
                                      fileName: AppAssets.icPerson,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                },
              ),
              Positioned(
                right: 70,
                bottom: -30,
                child: InkWell(
                  onTap: controller.pickProfilePic,
                  child: const AssetImageView(
                    fileName: AppAssets.icImagePick,
                    //width: 60,
                    //height: 60,
                  ),
                ),
              ),
            ],
          ),
          52.height,
          TextFormFieldWidget(
            controller: controller.nameController,
            hintText: appLocalization.name,
            validator: noValidator,
            prefix: AppAssets.icPerson,
          ),
          19.height,
          TextFormFieldWidget(
            controller: controller.emailController,
            hintText: appLocalization.email,
            validator: noValidator,
            prefix: AppAssets.icEmail,
          ),
          19.height,
          Obx(
            () {
              return TextFormFieldWidget(
                controller: controller.passwordController,
                hintText: appLocalization.password,
                validator: noValidator,
                obscureText: !controller.showPassword.value,
                prefix: AppAssets.icPassword,
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
          19.height,
          Obx(
            () {
              return TextFormFieldWidget(
                controller: controller.confirmPasswordController,
                hintText: appLocalization.confirmPassword,
                validator: noValidator,
                obscureText: !controller.showPassword.value,
                prefix: AppAssets.icPassword,
                suffix: IconButton(
                  icon: Icon(
                    controller.showConfirmPassword.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: const Color(0xFFA9AFC7),
                  ),
                  onPressed: controller.showConfirmPassword.toggle,
                ),
              );
            },
          ),
          78.height,
          BaseButton(
            buttonText: appLocalization.login,
            onPressed: controller.signUp,
          ),
          40.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: controller.signInWithFacebook,
                child: const AssetImageView(
                  fileName: AppAssets.icFacebook,
                ),
              ),
              14.width,
              InkWell(
                onTap: controller.signInWithGoogle,
                child: const AssetImageView(
                  fileName: AppAssets.icGoogle,
                ),
              ),
            ],
          ),
          52.height,
          Center(
            child: GestureDetector(
              onTap: Get.back,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    appLocalization.alreadyHaveAccount,
                    style: const TextStyle(
                      color: Color(0xFF383C40),
                      fontSize: 17.36,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  8.width,
                  Text(
                    appLocalization.login,
                    style: const TextStyle(
                      color: Color(0xFF2893E3),
                      fontSize: 17.36,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
          ),
          54.height,
        ],
      ),
    );
  }
}
