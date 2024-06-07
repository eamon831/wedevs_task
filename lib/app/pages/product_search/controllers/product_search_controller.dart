import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '/app/core/base/base_controller.dart';
import '/app/model/product.dart';
import '../components/product_filter_bottom_sheet.dart';

class ProductSearchController extends BaseController {
  final products = Rx<List<Product>?>(null);
  final selectedFilter = Rx<FilterType?>(null);
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

  String translateFilter(FilterType filter) {
    switch (filter) {
      case FilterType.newest:
        return appLocalization.newest;
      case FilterType.oldest:
        return appLocalization.oldest;
      case FilterType.priceLowToHigh:
        return appLocalization.priceLowToHigh;
      case FilterType.priceHighToLow:
        return appLocalization.priceHighToLow;
      case FilterType.bestSelling:
        return appLocalization.bestSelling;
    }
  }

  Future<void> filterProducts(BuildContext context) async {
    final result = await Get.bottomSheet(
      ProductFilterBottomSheet(
        filterType: selectedFilter.value,
      ),
    );
    if (result != null) {
      // this is supposed to be a api based filter but we don't have the api
      // so we are just filtering the list locally

      final FilterType filter = result[0];
      selectedFilter.value = filter;

      if (filter == FilterType.newest) {
        products.value!.sort(
          (a, b) => a.dateCreated!.compareTo(b.dateCreated!),
        );
      }
      if (filter == FilterType.oldest) {
        products.value!.sort(
          (a, b) => b.dateCreated!.compareTo(a.dateCreated!),
        );
      }
      if (filter == FilterType.priceLowToHigh) {
        products.value!.sort(
          (a, b) => a.price!.toDouble().compareTo(b.price!.toDouble()),
        );
      }
      if (filter == FilterType.priceHighToLow) {
        products.value!.sort(
          (a, b) => b.price!.toDouble().compareTo(a.price!.toDouble()),
        );
      }
      if (filter == FilterType.bestSelling) {
        products.value!.sort(
          (a, b) => a.totalSales!.compareTo(b.totalSales!),
        );
        products.value = products.value!.reversed.toList();
      }

      products.refresh();
    } else {
      selectedFilter.value = null;
      await fetchProducts();
    }
  }
}
