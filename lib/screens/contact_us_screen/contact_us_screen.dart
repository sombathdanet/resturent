import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/components/app_bar/appbar_title.dart';
import 'package:restaurant_app/components/app_bar/appbar_title_iconbutton.dart';
import 'package:restaurant_app/components/app_bar/custom_app_bar.dart';
import 'package:restaurant_app/components/custom_icon_button.dart';
import 'package:restaurant_app/components/custom_image_view.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/themes/custom_text_style.dart';
import 'package:restaurant_app/themes/theme_helper.dart';

import '../../../constants/image_constant.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Container _buildBody() {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
                imagePath: ImageConstant.imgHelpImage,
                height: 360.adaptSize,
                width: 360.adaptSize),
            SizedBox(height: 22.v),
            _buildRestaurantLocation(),
            SizedBox(height: 29.v),
            _buildTiming(),
            SizedBox(height: 28.v),
            Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: Row(
                children: [
                  CustomImageView(
                    color: appTheme.orange800,
                    imagePath: ImageConstant.imgCall,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    margin: EdgeInsets.only(top: 1.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14.h),
                    child: Text(
                      "086-393-923".tr,
                      style: CustomTextStyles.titleLargeBlack900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 36.v),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 96.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    borderRadius: BorderRadius.circular(16.0),
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgTwitter1,
                    ),
                  ),
                  const Spacer(flex: 50),
                  CustomIconButton(
                    borderRadius: BorderRadius.circular(16.0),
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgFacebook1,
                    ),
                  ),
                  const Spacer(flex: 50),
                  CustomIconButton(
                    borderRadius: BorderRadius.circular(16.0),
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgInstagram11,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.v)
          ],
        ),
      );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 80.v,
      centerTitle: true,
      leadingWidth: 80.v,
      leading:  AppbarTitleIconButton(
          color: appTheme.blue300,
          imagePath: ImageConstant.imgVectorWhiteA700,
          margin: EdgeInsets.only(top: 1.v, bottom: 3.v),
          onTap: () {
            onTapVector();
          }),
      title: AppbarTitle(
        text: "Contact Us".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildRestaurantLocation() {
    return Padding(
      padding: EdgeInsets.only(left: 2.h, right: 35.h),
      child: Row(
        children: [
          CustomImageView(
              color: appTheme.orange800,
              imagePath: ImageConstant.imgCiLocation,
              height: 24.adaptSize,
              width: 24.adaptSize),
          Padding(
            padding: EdgeInsets.only(left: 14.h),
            child: Text("Rersey keo, Phnom Penh".tr,
                style: CustomTextStyles.titleLargeBlack900),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTiming() {
    return Padding(
      padding: EdgeInsets.only(left: 2.h, right: 21.h),
      child: Row(
        children: [
          CustomImageView(
              color: appTheme.orange800,
              imagePath: ImageConstant.imgBxBxsTimeFive,
              height: 24.adaptSize,
              width: 24.adaptSize),
          Padding(
            padding: EdgeInsets.only(left: 14.h),
            child: Text(
              "08-00 to 22-00 , All days of week".tr,
              style: CustomTextStyles.titleLargeBlack900,
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapVector() {
    Get.back();
  }
}
