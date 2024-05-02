import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/components/app_bar/appbar_title.dart';
import 'package:restaurant_app/components/app_bar/custom_app_bar.dart';
import 'package:restaurant_app/components/custom_field_view.dart';
import 'package:restaurant_app/components/custom_heading.dart';
import 'package:restaurant_app/components/custom_tab_bar.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/screens/menu-screen/controller/menu_controller.dart';

import '../../routes/app_routes.dart';
import '../../themes/theme_helper.dart';

class MenuScreen extends StatelessWidget  {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body:_buildBody(),
    );
  }

  Widget _buildBody() {
    final controller = Get.find<MenuScreenController>();
    return Column(
      children: [
        SizedBox(height: 12.v),
        InkWell(
          onTap: (){
            Get.toNamed(AppRoutes.searchScreen);
          },
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.h,),
              padding: EdgeInsets.symmetric(vertical: 11.v),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.h),
                color: appTheme.whiteA700,
                border: Border.all(
                  color: appTheme.blueGray100,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.h,
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey.shade600,
                      size: 20.adaptSize,
                    ),
                  ),
                  Text("Type a dish or cuisine".tr,style: theme.textTheme.bodyMedium,),
                ],)
          ),
        ),
        SizedBox(height: 12.v),
        const CustomTitleHeading(
          text: "Select Category",
        ),
        SizedBox(height: 12.v),
         Expanded(
          child: Obx(()=> controller.isLoading.value ?const CustomTabBar():Container()),
        ),
      ],
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(top: 18.h),
        child: AppbarTitle(
          text: "Menu".tr,
        ),
      ),
      styleType: Style.bgFill,
    );
  }

  /// Navigates to the previous screen.
  onTapVector() {
    Get.back();
  }
}
