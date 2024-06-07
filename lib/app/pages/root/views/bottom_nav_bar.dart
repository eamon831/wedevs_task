import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevs_task/app/core/values/app_assets.dart';

import '/app/core/base/base_widget_mixin.dart';
import '/app/core/values/app_values.dart';
import '/app/core/widget/asset_image_view.dart';
import '/app/pages/root/controllers/bottom_nav_controller.dart';
import '/app/pages/root/model/menu_code.dart';
import '/app/pages/root/model/menu_item.dart';

typedef OnBottomNavItemSelected = Function(MenuCode menuCode);

class BottomNavBar extends StatelessWidget with BaseWidgetMixin {
  BottomNavBar({
    required this.onItemSelected,
    super.key,
  });

  final OnBottomNavItemSelected onItemSelected;
  final navController = BottomNavController();
  final Key bottomNavKey = GlobalKey();
  final Color selectedItemColor = const Color(0xFFFF679B);
  final Color unselectedItemColor = const Color(0xFF6E7FAA);

  static const _floatingButtonTopOffset = -25.0;
  static const _floatingButtonSpaceWidth = 40.0;
  final List<BottomNavItem> navItems = [];

  @override
  Widget body(BuildContext context) {
    navItems.addAll(_getNavItems());
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 60),
          painter: BNBCustomPainter(),
        ),
        SizedBox(
          height: 60,
          child: Obx(
            () {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(0, AppAssets.icHome),
                  _buildNavItem(1, AppAssets.icCategory),
                  const SizedBox(width: _floatingButtonSpaceWidth),
                  _buildNavItem(3, AppAssets.icCart),
                  _buildNavItem(4, AppAssets.icPerson),
                ],
              );
            },
          ),
        ),
        Positioned(
          top: _floatingButtonTopOffset,
          child: _buildFloatingButton(2, AppAssets.icSearchWithBgSvg),
        ),
      ],
    );
  }

  Widget _buildNavItem(int index, String iconName) {
    final isSelected = navController.selectedIndex == index;
    return InkWell(
      onTap: () {
        navController.updateSelectedIndex(index);
        onItemSelected(navItems[index].menuCode);
      },
      child: AssetImageView(
        fileName: iconName,
        height: AppValues.iconDefaultSize,
        width: AppValues.iconDefaultSize,
        color: isSelected ? selectedItemColor : unselectedItemColor,
      ),
    );
  }

  Widget _buildFloatingButton(int index, String iconName) {
    return InkWell(
      onTap: () {
        navController.updateSelectedIndex(index);
        onItemSelected(navItems[index].menuCode);
      },
      child: AssetImageView(
        fileName: iconName,
        fit: BoxFit.contain,
      ),
    );
  }

  List<BottomNavItem> _getNavItems() {
    final navItems = MenuCode.values.map(
      (e) {
        return e.toBottomNavItem(appLocalization);
      },
    ).toList();
    return navItems;
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    //box-shadow: 2px 3px 6px 0px #4D587721;

    final Path path = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(size.width * 0.2, 0, size.width * 0.35, 0)
      ..quadraticBezierTo(size.width * 0.4, 0, size.width * 0.4, 20)
      ..arcToPoint(
        Offset(size.width * 0.6, 10),
        radius: const Radius.circular(10),
        clockwise: false,
      )
      ..quadraticBezierTo(size.width * 0.6, 0, size.width * 0.65, 0)
      ..quadraticBezierTo(size.width * 0.8, 0, size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas
      ..drawShadow(path, Colors.black, 10, true)
      ..drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
