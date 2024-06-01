import 'package:flutter/material.dart';
import '/app/core/base/base_view.dart';
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
    return Container();
  }
}
  