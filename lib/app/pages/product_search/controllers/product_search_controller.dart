import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';
import '/app/model/product.dart';
import '../components/product_filter_bottom_sheet.dart';

class ProductSearchController extends BaseController {
  final products = Rx<List<Product>?>(null);
  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchProducts();
  }

  Future<void> fetchProducts() async {
    await dataFetcher(
      () async {
        final list = await services.fetchProducts();
        if (list != null) {
          products.value ??= [];
          products.value = list;
        }
      },
    );
  }

  Future<void> filterProducts(BuildContext context) async {
    final result = await  Get.bottomSheet(
      ProductFilterBottomSheet(),
    );
    if (result != null) {
      print(result);
    }else{
      print('result is null');
    }
  }
}
