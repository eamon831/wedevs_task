import 'package:get/get.dart';
import '/app/core/base/base_controller.dart';

class RootController extends BaseController {
  final currentIndex = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
