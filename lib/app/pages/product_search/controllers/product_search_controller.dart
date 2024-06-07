import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '/app/core/base/base_controller.dart';
import '/app/model/product.dart';
import '../components/product_filter_bottom_sheet.dart';

class ProductSearchController extends BaseController {
  final products = Rx<List<Product>?>(null);
  final selectedFilter = Rx<String?>(null);
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
    final result = await Get.bottomSheet(
      ProductFilterBottomSheet(),
    );
    if (result != null) {
      // this is supposed to be a api based filter but we don't have the api
      // so we are just filtering the list locally

      final FilterType filter = result[0];

      if (filter == FilterType.newest) {
        selectedFilter.value = appLocalization.newest;
        products.value!.sort(
          (a, b) => a.dateCreated!.compareTo(b.dateCreated!),
        );
      }
      if (filter == FilterType.oldest) {
        selectedFilter.value = appLocalization.oldest;
        products.value!.sort(
          (a, b) => b.dateCreated!.compareTo(a.dateCreated!),
        );
      }
      if (filter == FilterType.priceLowToHigh) {
        selectedFilter.value = appLocalization.priceLowToHigh;
        products.value!.sort(
          (a, b) => a.price!.toDouble().compareTo(b.price!.toDouble()),
        );
      }
      if (filter == FilterType.priceHighToLow) {
        selectedFilter.value = appLocalization.priceHighToLow;
        products.value!.sort(
          (a, b) => b.price!.toDouble().compareTo(a.price!.toDouble()),
        );
      }
      if (filter == FilterType.bestSelling) {
        selectedFilter.value = appLocalization.bestSelling;
        products.value!.sort(
          (a, b) => a.totalSales!.compareTo(b.totalSales!),
        );
        products.value = products.value!.reversed.toList();
      }

      products.refresh();
    } else {
      fetchProducts();
    }
  }
}
