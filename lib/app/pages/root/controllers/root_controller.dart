import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';
import '/app/pages/root/model/menu_code.dart';

class RootController extends BaseController {
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  final _selectedMenuCodeController = MenuCode.productSearch.obs;

  MenuCode get selectedMenuCode => _selectedMenuCodeController.value;

  Future<void> onMenuSelected(MenuCode menuCode) async {
    _selectedMenuCodeController(menuCode);
  }
}
