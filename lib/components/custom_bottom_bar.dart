import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';

import '../constants/image_constant.dart';
import '../themes/app_decoration.dart';
import '../themes/custom_text_style.dart';
import '../themes/theme_helper.dart';
import 'custom_image_view.dart';

class CustomBottomBar extends StatelessWidget {
  final void Function(BottomBarEnum)? onChanged;

  final _selectedIndex = 0.obs;

  final List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHome,
      title: "Home".tr,
      type: BottomBarEnum.home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavMenu,
      activeIcon: ImageConstant.imgNavMenu,
      title: "Menu".tr,
      type: BottomBarEnum.menu,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavBooking,
      activeIcon: ImageConstant.imgNavBooking,
      title: "History".tr,
      type: BottomBarEnum.history,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavFavorite,
      activeIcon: ImageConstant.imgNavFavorite,
      title: "Favorite".tr,
      type: BottomBarEnum.favorite,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavCart,
      activeIcon: ImageConstant.imgNavCart,
      title: "Cart".tr,
      type: BottomBarEnum.cart,
    )
  ];

  CustomBottomBar({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration:  BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              offset: const Offset(0,-5),
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: Theme.of(context).primaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: _selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            final item = bottomMenuList[index];
            return BottomNavigationBarItem(
              icon: _buildBottomBarItem(
                  item.icon, item.title, appTheme.black900.withOpacity(0.5)),
              activeIcon: _buildBottomBarItem(
                  item.activeIcon, item.title, appTheme.black900),
              label: '',
            );
          }),
          onTap: (index) {
            _selectedIndex.value = index;
            onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }

  Widget _buildBottomBarItem(String icon, String? title, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: icon,
          height: 22.adaptSize,
          width: 22.adaptSize,
          color: color,
          margin: EdgeInsets.only(top: 15.v),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.v, bottom: 4.v),
          child: Text(
            title ?? "",
            style: CustomTextStyles.bodySmallPoppinsBlack900Light_1
                .copyWith(color: color),
          ),
        ),
      ],
    );
  }
}

enum BottomBarEnum {
  home,
  menu,
  history,
  favorite,
  cart,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  final String icon;
  final String activeIcon;
  final String? title;
  final BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10 ),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
