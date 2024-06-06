import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';
import '/app/model/product.dart';

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
}
