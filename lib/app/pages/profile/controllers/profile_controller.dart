import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevs_task/app/core/values/app_assets.dart';

import '/app/core/base/base_controller.dart';
import '/app/shared_views/account_view/account_view.dart';

enum ProfileButtonEnum { account, passwords, notification, wishlist }

class ProfileController extends BaseController {
  late List<ProfileButton> profileButtonList = [
    ProfileButton.account(
      onTap: toggleButton(ProfileButtonEnum.account),
      title: () => appLocalization.account,
    ),
    ProfileButton.passwords(
      onTap: toggleButton(ProfileButtonEnum.passwords),
      title: () => appLocalization.passwords,
    ),
    ProfileButton.notification(
      onTap: toggleButton(ProfileButtonEnum.notification),
      title: () => appLocalization.notification,
    ),
    ProfileButton.wishlist(
      onTap: toggleButton(ProfileButtonEnum.wishlist),
      isLast: true,
      title: () => appLocalization.wishlist,
    ),
  ];

  final selectedProfileButton = Rx<ProfileButtonEnum?>(null);

  VoidCallback toggleButton(ProfileButtonEnum buttonEnum) {
    return () {
      final button = profileButtonList.firstWhere(
        (btn) => btn.profileButtonEnum == buttonEnum,
      );
      button.isOpen.value = !button.isOpen.value;
      selectedProfileButton.value = buttonEnum;
    };
  }

  @override
  Future<void> onInit() async {
    super.onInit();
  }
}

class ProfileButton {
  final String Function() title;
  final String fileName;
  final VoidCallback onTap;
  final RxBool isOpen;
  final bool isLast;
  final ProfileButtonEnum profileButtonEnum;
  Widget child;

  ProfileButton({
    required this.title,
    required this.fileName,
    required this.onTap,
    required this.profileButtonEnum,
    this.isLast = false,
    this.child = const SizedBox(),
  }) : isOpen = false.obs;

  ProfileButton.account({
    required VoidCallback onTap,
    required String Function() title,
  }) : this(
          title: title,
          fileName: AppAssets.icPerson,
          onTap: onTap,
          profileButtonEnum: ProfileButtonEnum.account,
          child: SizedBox(
            height: Get.height,
            child: AccountView(),
          ),
        );

  ProfileButton.passwords({
    required VoidCallback onTap,
    required String Function() title,
  }) : this(
          title: title,
          fileName: AppAssets.icPassword,
          onTap: onTap,
          profileButtonEnum: ProfileButtonEnum.passwords,
        );

  ProfileButton.notification({
    required VoidCallback onTap,
    required String Function() title,
  }) : this(
          title: title,
          fileName: AppAssets.icBell,
          onTap: onTap,
          profileButtonEnum: ProfileButtonEnum.notification,
        );

  ProfileButton.wishlist({
    required VoidCallback onTap,
    required String Function() title,
    bool isLast = false,
  }) : this(
          title: title,
          fileName: AppAssets.icHeart,
          onTap: onTap,
          profileButtonEnum: ProfileButtonEnum.wishlist,
          isLast: isLast,
        );
}
