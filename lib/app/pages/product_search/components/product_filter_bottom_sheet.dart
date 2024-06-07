import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wedevs_task/app/core/values/app_assets.dart';
import 'package:wedevs_task/app/core/widget/asset_image_view.dart';
import 'package:wedevs_task/app/core/widget/base_button.dart';

enum FilterType {
  newest,
  oldest,
  priceLowToHigh,
  priceHighToLow,
  bestSelling,
}

class ProductFilterBottomSheet extends StatelessWidget {
  ProductFilterBottomSheet({super.key});
  AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  final selectedFilter = Rx<List<FilterType>>([]);

  void _toggleFilter(FilterType filter) {
    selectedFilter.value.clear();
    selectedFilter.value.add(filter);

    // for multiple selection use this
    /*  selectedFilter.value.contains(filter)
        ? selectedFilter.value.remove(filter)
        : selectedFilter.value.add(filter);*/

    selectedFilter.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 22),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          27.height,
          Center(
            child: Container(
              height: 3,
              width: 47,
              decoration: BoxDecoration(
                color: const Color(0xFFFFD3DD),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          20.height,
          Text(
            appLocalization.filter,
            style: GoogleFonts.roboto(
              fontSize: 17.36,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF000000),
            ),
          ),
          18.height,
          Obx(
            () => Column(
              children: [
                _selectFilter(
                  title: appLocalization.newest,
                  isSelected: selectedFilter.value.contains(
                    FilterType.newest,
                  ),
                  onTap: () => _toggleFilter(FilterType.newest),
                ),
                _selectFilter(
                  title: appLocalization.oldest,
                  isSelected: selectedFilter.value.contains(
                    FilterType.oldest,
                  ),
                  onTap: () => _toggleFilter(FilterType.oldest),
                ),
                _selectFilter(
                  title: appLocalization.priceLowToHigh,
                  isSelected: selectedFilter.value.contains(
                    FilterType.priceLowToHigh,
                  ),
                  onTap: () => _toggleFilter(FilterType.priceLowToHigh),
                ),
                _selectFilter(
                  title: appLocalization.priceHighToLow,
                  isSelected: selectedFilter.value.contains(
                    FilterType.priceHighToLow,
                  ),
                  onTap: () => _toggleFilter(FilterType.priceHighToLow),
                ),
                _selectFilter(
                  title: appLocalization.bestSelling,
                  isSelected: selectedFilter.value.contains(
                    FilterType.bestSelling,
                  ),
                  onTap: () => _toggleFilter(FilterType.bestSelling),
                ),
              ],
            ),
          ),
          70.height,
          Row(
            children: [
              Expanded(
                child: BaseButton(
                  buttonText: appLocalization.cancel,
                  height: 50,
                  width: 135,
                  bgColor: Colors.transparent,
                  borderColor: const Color(0xFFbababa),
                  customButtonTextStyle: GoogleFonts.lato(
                    fontSize: 17.36,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF607374),
                  ),
                  onPressed: Get.back,
                ),
              ),
              20.width,
              Expanded(
                child: BaseButton(
                  buttonText: appLocalization.apply,
                  height: 50,
                  width: 135,
                  bgColor: const Color(0xFF1ABC9C),
                  customButtonTextStyle: GoogleFonts.roboto(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFFFFFFF),
                  ),
                  onPressed: () {
                    Get.back(
                      result: selectedFilter.value,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _selectFilter({
    required final String title,
    required final bool isSelected,
    required final void Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
          bottom: 12,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            AssetImageView(
              fileName:
                  isSelected ? AppAssets.icSelected : AppAssets.icUnselected,
              height: 24,
              width: 24,
            ),
            12.width,
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF000000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
