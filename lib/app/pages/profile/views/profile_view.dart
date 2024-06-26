import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wedevs_task/app/core/values/app_assets.dart';
import 'package:wedevs_task/app/core/values/text_styles.dart';
import 'package:wedevs_task/app/core/widget/asset_image_view.dart';
import 'package:wedevs_task/app/core/widget/base_button.dart';
import '/app/core/base/base_view.dart';
import '/app/pages/profile/controllers/profile_controller.dart';

//ignore: must_be_immutable
class ProfileView extends BaseView<ProfileController> {
  ProfileView({super.key});

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
        top: 26,
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: Text(
              appLocalization.myAccount,
              style: titleStyle,
            ),
          ),
          41.height,
          DottedBorder(
            borderType: BorderType.Circle,
            padding: const EdgeInsets.all(8),
            color: const Color(0xFFFFADAD),
            strokeWidth: 2,
            dashPattern: const [6, 4],
            child: Center(
              child: SizedBox(
                height: 112,
                width: 112,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: const AssetImageView(
                    fileName: AppAssets.icProfilePic,
                  ),
                ),
              ),
            ),
          ),
          40.height,
          Center(
            child: Column(
              children: [
                Text(
                  controller.loggedUser.userNiceName ?? '',
                  style: titleStyle.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Lato',
                  ),
                ),
                6.height,
                Text(
                  controller.loggedUser.userEmail ?? '',
                  style: titleStyle.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Lato',
                  ),
                ),
              ],
            ),
          ),
          40.height,
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: controller.profileButtonList.map(
                (e) {
                  return profilePageButton(
                    element: e,
                  );
                },
              ).toList(),
            ),
          ),
          20.height,
          BaseButton(
            buttonText: appLocalization.changeLanguage,
            bgColor: Colors.transparent,
            borderColor: const Color(0xFFbababa),
            customButtonTextStyle: GoogleFonts.lato(
              fontSize: 17.36,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF607374),
            ),
            onPressed: controller.changeLocale,
          ),
          10.height,
          BaseButton(
            buttonText: appLocalization.logout,
            bgColor: Colors.red,
            borderColor: const Color(0xFFbababa),
            customButtonTextStyle: GoogleFonts.lato(
              fontSize: 17.36,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            onPressed: controller.logout,
          ),
          20.height,
        ],
      ),
    );
  }

  Widget profilePageButton({
    required ProfileButton element,
  }) {
    return InkWell(
      onTap: element.onTap,
      child: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: element.isLast ? 21 : 0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                AssetImageView(
                  fileName: element.fileName,
                  width: 22,
                  height: 22,
                ),
                14.width,
                Text(
                  element.title(),
                  style: titleStyle.copyWith(
                    fontSize: 17.36,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                    color: const Color(0xFF000000),
                  ),
                ),
                if (element.profileButtonEnum == ProfileButtonEnum.wishlist)
                  Text(
                    ' (00)',
                    style: titleStyle.copyWith(
                      fontSize: 17.36,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      color: const Color(0xFF7c8592),
                    ),
                  ),
                const Spacer(),
                Obx(
                  () {
                    return element.isOpen.value
                        ? const SizedBox(
                            width: 12,
                            height: 7,
                            child: AssetImageView(
                              fileName: AppAssets.icArrowDown,
                            ),
                          )
                        : const SizedBox(
                            width: 12,
                            height: 12,
                            child: AssetImageView(
                              fileName: AppAssets.icArrowRight,
                            ),
                          );
                  },
                ),
              ],
            ),
            Obx(
              () => element.isOpen.value ? element.child : Container(),
            ),
            if (!element.isLast)
              Column(
                children: [
                  20.height,
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
