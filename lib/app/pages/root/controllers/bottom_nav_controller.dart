import 'package:get/get.dart';

class BottomNavController extends GetxController {
  final _selectedIndexController = 2.obs;

  int updateSelectedIndex(int index) => _selectedIndexController(index);

  int get selectedIndex => _selectedIndexController.value;
}
