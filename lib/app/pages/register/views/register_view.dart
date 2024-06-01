import 'package:flutter/material.dart';
import '/app/core/base/base_view.dart';
import '/app/pages/register/controllers/register_controller.dart';

//ignore: must_be_immutable
class RegisterView extends BaseView<RegisterController> {
  RegisterView({super.key});
    
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }
  
  @override
  Widget body(BuildContext context) {
    return Container();
  }
}
  