import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wedevs_task/app/core/values/app_assets.dart';
import 'package:wedevs_task/app/core/values/text_styles.dart';
import 'package:wedevs_task/app/core/widget/asset_image_view.dart';
import 'package:wedevs_task/app/shared_views/product_card_view.dart';
import '/app/core/base/base_view.dart';
import '/app/pages/product_search/controllers/product_search_controller.dart';

//ignore: must_be_immutable
class ProductSearchView extends BaseView<ProductSearchController> {
  ProductSearchView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 22,
        right: 22,
      ),
      child: Column(
        children: [
          20.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Text(
                appLocalization.productList,
                style: titleStyle.copyWith(
                  fontSize: 22.57,
                ),
              ),
              const SizedBox(
                height: 22,
                width: 22,
                child: AssetImageView(
                  fileName: AppAssets.icSearch,
                  color: Color(0xFF222455),
                ),
              ),
            ],
          ),
          30.height,
          InkWell(
            onTap: () => controller.filterProducts(context),
            child: Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 22,
                bottom: 22,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.transparent,
                  width: 0,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A395AB8),
                    offset: Offset(0, 3),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(
                    height: 16,
                    width: 16,
                    child: AssetImageView(
                      fileName: AppAssets.icFilter,
                      fit: BoxFit.contain,
                      color: Color(0xFFB6BED4),
                    ),
                  ),
                  11.width,
                  Obx(
                    () => Expanded(
                      child: Text(
                        controller.selectedFilter.value == null
                            ? appLocalization.filter
                            : controller.selectedFilter.value!,
                        style: GoogleFonts.lato(
                          color: const Color(0xFF818995),
                          fontSize: 15.63,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    appLocalization.sortBy,
                    style: GoogleFonts.lato(
                      color: const Color(0xFF818995),
                      fontSize: 15.63,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  5.width,
                  const SizedBox(
                    height: 13.54,
                    width: 7.64,
                    child: AssetImageView(
                      fileName: AppAssets.icArrowDown,
                      fit: BoxFit.contain,
                      color: Color(0xFFB6BED4),
                    ),
                  ),
                  22.width,
                  const SizedBox(
                    height: 14,
                    width: 19,
                    child: AssetImageView(
                      fileName: AppAssets.icMenu,
                      fit: BoxFit.contain,
                      color: Color(0xFF222455),
                    ),
                  ),
                ],
              ),
            ),
          ),
          30.height,
          Expanded(
            child: Obx(
              () {
                return MasonryGridView.builder(
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: controller.products.value?.length ?? 0,
                  mainAxisSpacing: 14.01,
                  crossAxisSpacing: 14.5,
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  itemBuilder: (context, index) {
                    final item = controller.products.value![index];
                    final rating =
                        double.tryParse(item.averageRating ?? '0') ?? 0;
                    return ProductCardView(
                      item: item,
                      rating: rating,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
