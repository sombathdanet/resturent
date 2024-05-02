import 'package:get/get.dart';
import 'package:restaurant_app/components/custom_image_view.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';

import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/splash_screen/splash_screen_controller.dart';
import 'package:restaurant_app/themes/custom_text_style.dart';
import 'package:restaurant_app/themes/theme_helper.dart';

import '../../../constants/image_constant.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  SizedBox _buildBody() {
    return SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 11.v),
            child: Column(
              children: [
                CustomImageView(
                  color: appTheme.orange800,
                  imagePath: ImageConstant.imgVector,
                  height: 187.v,
                  width: 143.h,
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(height: 101.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("C".tr, style: theme.textTheme.displayMedium),
                    Padding(
                      padding: EdgeInsets.only(left: 6.h),
                      child:
                          Text("R".tr, style: theme.textTheme.displayMedium),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6.h),
                      child:
                          Text("A".tr, style: theme.textTheme.displayMedium),
                    ),
                    CustomImageView(
                      color: appTheme.gray400,
                      imagePath: ImageConstant.imgAirplane,
                      height: 32.adaptSize,
                      width: 32.adaptSize,
                      margin: EdgeInsets.only(
                        left: 6.h,
                        top: 13.v,
                        bottom: 14.v,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6.h),
                      child: Text(
                        "E".tr,
                        style: CustomTextStyles.displayMedium_1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 36.v),
                SizedBox(
                  child: Text(
                    "Dining and Delivery Restaurant App".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.headlineMediumBlack900.copyWith(
                      height: 1.14,
                    ),
                  ),
                ),
                SizedBox(height: 201.v),
                CustomImageView(
                  color: appTheme.orange800,
                  imagePath: ImageConstant.imgVectorOrange800,
                  height: 191.v,
                  width: 193.h,
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 2.h),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
