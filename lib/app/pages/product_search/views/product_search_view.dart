import 'package:flutter/material.dart';
import '/app/core/base/base_view.dart';
import '/app/pages/product_search/controllers/product_search_controller.dart';

//ignore: must_be_immutable
class ProductSearchView extends BaseView<ProductSearchController> {
  ProductSearchView({super.key});
    
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }
  
  @override
  Widget body(BuildContext context) {
    return Container();
  }
}
  