import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/model/food_model/popular_food_model.dart';
import 'package:restaurant_app/screens/menu-screen/controller/menu_controller.dart';

import '../../../../components/custom_icon_button.dart';
import '../../../../components/custom_image_view.dart';
import '../../../../themes/app_decoration.dart';
import '../../../../themes/custom_text_style.dart';
import '../../../../themes/theme_helper.dart';
import '../constants/image_constant.dart';

class ProductCartItemWidget extends StatelessWidget {
  const ProductCartItemWidget({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPrice,
    required this.offerPercentage,
    required this.imagePath,
    this.onTap,
    this.dataPopular,
  });

  final String title;
  final String description;
  final String price;
  final String discountPrice;
  final String offerPercentage;
  final String imagePath;
  final VoidCallback? onTap;
  final DataPopular? dataPopular;

  @override
  Widget build(BuildContext context) {
    final MenuScreenController menuController = Get.find();
    return GetBuilder<MenuScreenController>(
      builder: (_) => SizedBox(
        width: 285.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: appTheme.deepPurple100,
                borderRadius: BorderRadiusStyle.roundedOnlyTopBorder15,
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  CustomImageView(
                    onTap: onTap,
                    imagePath: imagePath,
                    width: 285.h,
                    height: 145.v,
                    fit: BoxFit.cover,
                    radius: BorderRadiusStyle.customBorderTL15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 7.v,
                      right: 8.h,
                    ),
                    child: CustomIconButton(
                      onTap: ()=> menuController.addToFavorite(dataPopular!),
                      borderRadius: BorderRadiusStyle.roundedBorder15,
                      height: 32.adaptSize,
                      width: 32.adaptSize,
                      padding: EdgeInsets.all(8.h),
                      alignment: Alignment.topRight,
                      child:CustomImageView(
                        color:  menuController.isFav(dataPopular!)?appTheme.orange800:appTheme.black900,
                        imagePath: menuController.isFav(dataPopular!)?ImageConstant.imgOutline24pxNewHeart:ImageConstant.imgOutline24pxHeart,
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
                boxShadow: [AppDecoration.boxShadow],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 2.v),
                  Text(
                    title,
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
                                discountPrice,
                                style: CustomTextStyles.titleMediumGray800,
                              ),
                            ),
                            Opacity(
                              opacity: 0.9,
                              child: Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text(
                                  price,
                                  style: CustomTextStyles.labelLargeBlueGray100ab
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
                        width: 67.h,
                        margin: EdgeInsets.only(left: 122.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.h,
                          vertical: 1.v,
                        ),
                        decoration: AppDecoration.fillGreen.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
                        ),
                        child: Text(
                          offerPercentage,
                          style: CustomTextStyles.labelLargeGreen500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.v),
                  Container(
                    width: 248.h,
                    margin: EdgeInsets.only(right: 4.h),
                    child: Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodySmallGray500.copyWith(
                        height: 1.33,
                      ),
                    ),
                  ),
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
                          Text(
                            "(34)",
                            style: theme.textTheme.bodySmall,
                          ),
                          SizedBox(
                            width: 7.h,
                          ),
                          Text(
                            "Main Course",
                            style: theme.textTheme.labelLarge,
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
                          "Chef Pick",
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
      ),
    );
  }
}
