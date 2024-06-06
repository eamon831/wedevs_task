import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wedevs_task/app/core/values/text_styles.dart';
import 'package:wedevs_task/app/core/widget/asset_image_view.dart';
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
                  fileName: 'ic_search.svg',
                  color: Color(0xFF222455),
                ),
              ),
            ],
          ),
          30.height,
          Container(
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
                    fileName: 'ic_filter.svg',
                    fit: BoxFit.contain,
                    color: Color(0xFFB6BED4),
                  ),
                ),
                11.width,
                Text(
                  appLocalization.filter,
                  style: GoogleFonts.lato(
                    color: const Color(0xFF818995),
                    fontSize: 15.63,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
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
                    fileName: 'ic_arrow_down.svg',
                    fit: BoxFit.contain,
                    color: Color(0xFFB6BED4),
                  ),
                ),
                22.width,
                const SizedBox(
                  height: 14,
                  width: 19,
                  child: AssetImageView(
                    fileName: 'ic_menu.svg',
                    fit: BoxFit.contain,
                    color: Color(0xFF222455),
                  ),
                ),
              ],
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
                  itemBuilder: (context, index) {
                    final item = controller.products.value![index];
                    final rating =
                        double.tryParse(item.averageRating ?? '0') ?? 0;
                    return DecoratedBox(
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
                      child: Column(
                        mainAxisAlignment: startMAA,
                        crossAxisAlignment: startCAA,
                        children: [
                          SizedBox(
                            height: 177,
                            width: 160,
                            //image from network
                            child: Image.network(
                              item.images?[0].src ?? '',
                              errorBuilder: (context, error, stackTrace) {
                                return const AssetImageView(
                                  fileName: 'even_product_img.png',
                                );
                              },
                            ),
                          ),
                          10.height,
                          Container(
                            padding: const EdgeInsets.only(
                              left: 19,
                            ),
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: startMAA,
                              crossAxisAlignment: startCAA,
                              children: [
                                SizedBox(
                                  height: 32,
                                  child: Text(
                                    item.name ?? '',
                                    style: GoogleFonts.lato(
                                      color: const Color(0xFF222455),
                                      fontSize: 15.63,
                                      fontWeight: FontWeight.w700,
                                      height: 1.1,
                                    ),
                                  ),
                                ),
                                8.height,
                                HtmlWidget(item.priceHtml ?? ''),
                                12.height,
                                RatingBar.builder(
                                  initialRating: rating,
                                  minRating: 1,
                                  allowHalfRating: true,
                                  ignoreGestures: true,
                                  itemSize: 10,
                                  itemBuilder: (context, _) {
                                    return const Icon(
                                      Icons.star,
                                      color: Color(0xFFF5A623),
                                      size: 10,
                                    );
                                  },
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ],
                            ),
                          ),
                          18.height,
                        ],
                      ),
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
