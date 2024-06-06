import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevs_task/app/routes/app_pages.dart';
import '/app/core/base/base_view.dart';
import '/app/pages/cart/controllers/cart_controller.dart';

//ignore: must_be_immutable
class CartView extends BaseView<CartController> {
  CartView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            await controller.prefs.setIsLogin(isLogin: false);
            Get.offAllNamed(Routes.splash);
          },
          child: const Text('Restart app'),
        ),
        Text(
          controller.loggedUser.userNiceName ?? 'user null',
        ),
      ],
    );
  }
}
