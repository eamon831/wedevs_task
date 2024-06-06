import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          iconSvgName: 'ic_home.svg',
          menuCode: MenuCode.home,
        );
      case MenuCode.category:
        return BottomNavItem(
          navTitle: appLocalization.bottomNavCategory,
          iconSvgName: 'ic_category.svg',
          menuCode: MenuCode.category,
        );
      case MenuCode.productSearch:
        return BottomNavItem(
          navTitle: appLocalization.bottomNavProductSearch,
          iconSvgName: 'ic_search.svg',
          menuCode: MenuCode.productSearch,
        );

      case MenuCode.cart:
        return BottomNavItem(
          navTitle: appLocalization.bottomNavCart,
          iconSvgName: 'ic_cart.svg',
          menuCode: MenuCode.cart,
        );
      case MenuCode.profile:
        return BottomNavItem(
          navTitle: appLocalization.bottomNavProfile,
          iconSvgName: 'ic_person.svg',
          menuCode: MenuCode.profile,
        );
    }
  }
}
