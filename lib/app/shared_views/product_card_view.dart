import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import '/app/core/values/app_assets.dart';
import '/app/core/widget/asset_image_view.dart';
import '/app/model/product.dart';

class ProductCardView extends StatelessWidget {
  final Product item;
  final double rating;
  const ProductCardView({
    required this.item,
    required this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 177,
            width: 160,
            //image from network
            child: Image.network(
              item.images?[0].src ?? '',
              errorBuilder: (context, error, stackTrace) {
                return const AssetImageView(
                  fileName: AppAssets.evenProductImg,
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      letterSpacing: 0.1,
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
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
          ),
          18.height,
        ],
      ),
    );
  }
}
