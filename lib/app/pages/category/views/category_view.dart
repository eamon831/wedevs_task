import 'package:flutter/material.dart';
import '/app/core/base/base_view.dart';
import '/app/pages/category/controllers/category_controller.dart';

//ignore: must_be_immutable
class CategoryView extends BaseView<CategoryController> {
  CategoryView({super.key});
    
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }
  
  @override
  Widget body(BuildContext context) {
    return Container();
  }
}
  