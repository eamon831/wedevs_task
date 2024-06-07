import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wedevs_task/app/core/values/app_assets.dart';

import 'menu_item.dart';

enum MenuCode {
  home,
  category,
  productSearch,
  cart,
  profile,
}

extension MenuCodeExtensions on MenuCode {
  BottomNavItem toBottomNavItem(
    AppLocalizations appLocalization,
  ) {
    switch (this) {
      case MenuCode.home:
        return BottomNavItem(
          navTitle: appLocalization.bottomNavHome,
          iconSvgName: AppAssets.icHome,
          menuCode: MenuCode.home,
        );
      case MenuCode.category:
        return BottomNavItem(
          navTitle: appLocalization.bottomNavCategory,
          iconSvgName: AppAssets.icCategory,
          menuCode: MenuCode.category,
        );
      case MenuCode.productSearch:
        return BottomNavItem(
          navTitle: appLocalization.bottomNavProductSearch,
          iconSvgName: AppAssets.icSearch,
          menuCode: MenuCode.productSearch,
        );

      case MenuCode.cart:
        return BottomNavItem(
          navTitle: appLocalization.bottomNavCart,
          iconSvgName: AppAssets.icCart,
          menuCode: MenuCode.cart,
        );
      case MenuCode.profile:
        return BottomNavItem(
          navTitle: appLocalization.bottomNavProfile,
          iconSvgName: AppAssets.icPerson,
          menuCode: MenuCode.profile,
        );
    }
  }
}
