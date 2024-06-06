import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/account_view.dart';
import '/app/core/base/base_controller.dart';

enum ProfileButtonEnum { account, passwords, notification, wishlist }

class ProfileController extends BaseController {
  late List<ProfileButton> profileButtonList = [
    ProfileButton.account(
      onTap: toggleButton(ProfileButtonEnum.account),
      title: appLocalization.account,
    ),
    ProfileButton.passwords(
      onTap: toggleButton(ProfileButtonEnum.passwords),
      title: appLocalization.passwords,
    ),
    ProfileButton.notification(
      onTap: toggleButton(ProfileButtonEnum.notification),
      title: appLocalization.notification,
    ),
    ProfileButton.wishlist(
      onTap: toggleButton(ProfileButtonEnum.wishlist),
      isLast: true,
      title: appLocalization.wishlist,
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
  final String title;
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
    required String title,
  }) : this(
          title: title,
          fileName: 'ic_person.svg',
          onTap: onTap,
          profileButtonEnum: ProfileButtonEnum.account,
          child:AccountView(),
        );

  ProfileButton.passwords({
    required VoidCallback onTap,
    required String title,
  }) : this(
          title: title,
          fileName: 'ic_password.svg',
          onTap: onTap,
          profileButtonEnum: ProfileButtonEnum.passwords,
        );

  ProfileButton.notification({
    required VoidCallback onTap,
    required String title,
  }) : this(
          title: title,
          fileName: 'ic_bell.svg',
          onTap: onTap,
          profileButtonEnum: ProfileButtonEnum.notification,
        );

  ProfileButton.wishlist({
    required VoidCallback onTap,
    required String title,
    bool isLast = false,
  }) : this(
          title: title,
          fileName: 'ic_heart.svg',
          onTap: onTap,
          profileButtonEnum: ProfileButtonEnum.wishlist,
          isLast: isLast,
        );
}
