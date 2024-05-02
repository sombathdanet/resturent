import 'package:flutter/material.dart';
import 'package:restaurant_app/components/custom_icon_button.dart';
import 'package:restaurant_app/components/custom_image_view.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/themes/app_decoration.dart';
import 'package:restaurant_app/themes/custom_text_style.dart';
import 'package:restaurant_app/themes/theme_helper.dart';

import '../constants/image_constant.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.v,
      width: 240.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        // scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 13.h,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 285.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: appTheme.deepPurple100,
                    borderRadius: BorderRadiusStyle.roundedBorder15,
                  ),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgMuttonLambBir,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 7.v,
                          right: 8.h,
                        ),
                        child: CustomIconButton(
                          height: 32.adaptSize,
                          width: 32.adaptSize,
                          padding: EdgeInsets.all(8.h),
                          alignment: Alignment.topRight,
                          child: CustomImageView(
                            color: appTheme.black900,
                            imagePath: ImageConstant.imgOutline24pxHeart,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: AppDecoration.fillWhiteA.copyWith(
                    borderRadius: BorderRadiusStyle.roundedOnlyBottomBorder15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 2.v),
                      Text(
                        "Pepper Pizza",
                        style: theme.textTheme.titleLarge,
                      ),
                      SizedBox(height: 1.v),
                      Row(
                        children: [
                          SizedBox(
                            width: 64.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Opacity(
                                  opacity: 0.9,
                                  child: Text(
                                    "199",
                                    style: CustomTextStyles.titleMediumGray800,
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.9,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 3.v),
                                    child: Text(
                                      "250",
                                      style: CustomTextStyles
                                          .labelLargeBlueGray100ab
                                          .copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: appTheme.gray500,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 78.h,
                            margin: EdgeInsets.only(left: 122.h),
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.h,
                              vertical: 1.v,
                            ),
                            decoration: AppDecoration.fillGreen.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10,
                            ),
                            child: Text(
                              "30% OFF",
                              style: CustomTextStyles.labelLargeGreen500,
                            ),
                          ),
                        ],
                      ),
                      //SizedBox(height: 5.v),

                      SizedBox(height: 13.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgFilled16pxStar,
                                color: appTheme.yellowA400,
                                height: 10.adaptSize,
                                width: 10.adaptSize,
                                margin: EdgeInsets.only(
                                  top: 3.v,
                                  bottom: 7.v,
                                  right: 7.v,
                                ),
                              ),
                              Text(
                                "5.0",
                                style: theme.textTheme.labelLarge,
                              ),
                              SizedBox(
                                width: 7.h,
                              ),
                            ],
                          ),
                          Container(
                            width: 78.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.h,
                              vertical: 1.v,
                            ),
                            decoration: AppDecoration.fillBlue.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10,
                            ),
                            child: Text(
                              "Top Selling",
                              style: CustomTextStyles.labelLargeBlue300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
