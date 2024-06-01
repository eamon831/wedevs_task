import 'package:flutter/material.dart';
import '/app/core/base/base_view.dart';
import '/app/pages/root/controllers/root_controller.dart';

//ignore: must_be_immutable
class RootView extends BaseView<RootController> {
  RootView({super.key});
    
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }
  
  @override
  Widget body(BuildContext context) {
    return Container();
  }
}
  