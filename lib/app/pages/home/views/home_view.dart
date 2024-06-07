import 'package:flutter/material.dart';
import '/app/core/base/base_view.dart';
import '/app/pages/home/controllers/home_controller.dart';

//ignore: must_be_immutable
class HomeView extends BaseView<HomeController> {
  HomeView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return const Column(
      children: [],
    );
  }
}
