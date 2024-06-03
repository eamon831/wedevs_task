import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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

  @override
  Widget floatingActionButton() {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.5),
        gradient: const LinearGradient(
          colors: [Color(0xFFFF9472), Color(0xFFF2709C)],
        ),
      ),
      child: FloatingActionButton(
        isExtended: true,
        elevation: 0,
        onPressed: () => controller.changeTab(4),
        backgroundColor: Colors.transparent,
        child: const Icon(
          FontAwesomeIcons.search,
          size: 18,
        ),
      ),
    );
  }

  @override
  Widget bottomNavigationBar() {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Obx(
              () => Icon(
                FontAwesomeIcons.home,
                size: 18,
                color: controller.currentIndex.value == 0
                    ? const Color(0xFFFF679B)
                    : const Color(0xFF6E7FAA),
              ),
            ),
            onPressed: () => controller.changeTab(0),
          ),
          IconButton(
            icon: Obx(
              () => Icon(
                FontAwesomeIcons.thLarge,
                size: 18,
                color: controller.currentIndex.value == 1
                    ? const Color(0xFFFF679B)
                    : const Color(0xFF6E7FAA),
              ),
            ),
            onPressed: () => controller.changeTab(1),
          ),
          IconButton(
            icon: Obx(
              () => Icon(
                FontAwesomeIcons.shoppingCart,
                size: 18,
                color: controller.currentIndex.value == 2
                    ? const Color(0xFFFF679B)
                    : const Color(0xFF6E7FAA),
              ),
            ),
            onPressed: () => controller.changeTab(2),
          ),
          IconButton(
            icon: Obx(
              () => Icon(
                FontAwesomeIcons.solidUser,
                size: 18,
                color: controller.currentIndex.value == 3
                    ? const Color(0xFFFF679B)
                    : const Color(0xFF6E7FAA),
              ),
            ),
            onPressed: () => controller.changeTab(3),
          ),
        ],
      ),
    );
  }
}
