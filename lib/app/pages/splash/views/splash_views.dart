import 'package:flutter/material.dart';
import 'package:wedevs_task/app/core/base/base_view.dart';
import '/app/pages/splash/controllers/splash_controller.dart';

class SplashViews extends BaseView<SplashController> {
  SplashViews({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Container();
  }
}
