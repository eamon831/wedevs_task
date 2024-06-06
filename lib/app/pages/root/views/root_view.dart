import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevs_task/app/core/widget/asset_image_view.dart';
import 'package:wedevs_task/app/pages/product_search/views/product_search_view.dart';

import '/app/core/base/base_view.dart';
import '/app/pages/cart/views/cart_view.dart';
import '/app/pages/category/views/category_view.dart';
import '/app/pages/home/views/home_view.dart';
import '/app/pages/profile/views/profile_view.dart';
import '/app/pages/root/controllers/root_controller.dart';
import '/app/pages/root/model/menu_code.dart';
import 'bottom_nav_bar.dart';

//ignore: must_be_immutable
class RootView extends BaseView<RootController> {
  RootView({super.key});
  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Widget body(BuildContext context) {
    return Container(
      key: UniqueKey(),
      child: Obx(
        () => getPageOnSelectedMenu(controller.selectedMenuCode),
      ),
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return BottomNavBar(onItemSelected: controller.onMenuSelected);
  }

  HomeView? homeView;
  CategoryView? categoryView;
  final ProductSearchView productSearchView = ProductSearchView();
  CartView? cartView;
  ProfileView? profileView;

  Widget getPageOnSelectedMenu(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.home:
        homeView ??= HomeView();
        return homeView!;
      case MenuCode.category:
        categoryView ??= CategoryView();
        return categoryView!;
      case MenuCode.productSearch:
        return productSearchView;
      case MenuCode.cart:
        cartView ??= CartView();
        return cartView!;
      case MenuCode.profile:
        profileView ??= ProfileView();
        return profileView!;

      default:
        return OtherView(
          viewParam: describeEnum(menuCode),
        );
    }
  }
}

class OtherView extends StatelessWidget {
  final String viewParam;
  const OtherView({
    required this.viewParam,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Other View: $viewParam'),
    );
  }
}
