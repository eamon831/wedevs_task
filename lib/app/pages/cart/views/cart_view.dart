import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevs_task/app/core/core_model/logged_user.dart';
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
    return Center(
      child: Text(
        appLocalization.bottomNavCart,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
