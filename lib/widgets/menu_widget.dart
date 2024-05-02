import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/components/custom_elevated_button.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/model/food_model/popular_food_model.dart';
import 'package:restaurant_app/routes/app_routes.dart';
import 'package:restaurant_app/screens/home_screen/controller/home_page_controller.dart';
import 'package:restaurant_app/screens/home_screen/home_screen_container.dart';
import 'package:restaurant_app/screens/menu-screen/controller/menu_controller.dart';

import '../../../../components/custom_image_view.dart';
import '../components/custom_icon_button.dart';
import '../constants/image_constant.dart';
import '../screens/home_screen/model/product_item_model.dart';
import '../themes/app_decoration.dart';
import '../themes/custom_button_style.dart';
import '../themes/custom_text_style.dart';
import '../themes/theme_helper.dart';

class MenuCardItemWidget extends StatefulWidget {
  const MenuCardItemWidget({
    super.key,
    this.dataPopular,
    required this.title,
    required this.price,
    required this.discountPrice,
    required this.offerPercentage,
    required this.imagePath,
    required this.smallPill,
  });
  final DataPopular? dataPopular;
  final String title;
  final String price;
  final String discountPrice;
  final String offerPercentage;
  final String imagePath;
  final String smallPill;

  @override
  State<MenuCardItemWidget> createState() => _MenuCardItemWidgetState();
}

class _MenuCardItemWidgetState extends State<MenuCardItemWidget> {
  @override
  Widget build(BuildContext context) {
    final MenuScreenController menuScreenController = Get.find();
    final HomeController homeController = Get.find();
    ProductItemModel model = homeController.homeModelObj.value.deliciousDessertItemList.value[0];
    return GetBuilder<MenuScreenController>(
      builder:(_)=> Row(
        children: [
          Container(
            width: 110.h,
            height: 110.v,
            decoration: AppDecoration.fillWhiteA.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
              boxShadow: [AppDecoration.boxShadow],
            ),
            child: Stack(
              alignment: Alignment.center ,
              children: [
                CustomImageView(
                  onTap: (){
                    homeController.routeToSpecialProductDetail(model,widget.dataPopular!.id!,widget.dataPopular!);
                  },
                  imagePath: widget.imagePath,
                  fit: BoxFit.fill,
                  width: 110.h,
                  height: 110.v,
                  radius: BorderRadiusStyle.roundedBorder10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 7.v,
                    right: 8.h,
                  ),
                  child: CustomIconButton(
                    onTap: (){
                      menuScreenController.addToFavorite(widget.dataPopular!);
                    },
                    borderRadius: BorderRadiusStyle.roundedBorder15,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                    padding: EdgeInsets.all(8.h),
                    alignment: Alignment.topRight,
                    child:CustomImageView(
                          color:  menuScreenController.isFav(widget.dataPopular!)?appTheme.orange800:appTheme.black900,
                          imagePath: menuScreenController.isFav(widget.dataPopular!)?ImageConstant.imgOutline24pxNewHeart:ImageConstant.imgOutline24pxHeart,
                        ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: 20.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 2.v),
                Text(
                  widget.title.toString(),
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(height: 1.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Opacity(
                          opacity: 0.9,
                          child: Text(
                            widget.price,
                            style: CustomTextStyles.titleMediumGray800,
                          ),
                        ),
                        SizedBox(width: 8.h),
                        Opacity(
                          opacity: 0.9,
                          child: Padding(
                            padding: EdgeInsets.only(top: 3.v),
                            child: Text(
                              widget.discountPrice,
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
                    Container(
                      width: 67.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.h,
                        vertical: 1.v,
                      ),
                      decoration: AppDecoration.fillGreen.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10,
                      ),
                      child: Text(
                        widget.offerPercentage,
                        style: CustomTextStyles.labelLargeGreen500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgFilled16pxStar,
                          color: appTheme.orange800,
                          height: 16.adaptSize,
                          width: 16.adaptSize,
                          margin: EdgeInsets.only(
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
                        Text(
                          "Fast Food",
                          style: theme.textTheme.labelLarge,
                        ),
                      ],
                    ),
                    Container(
                      width: 90.h,
                      padding: EdgeInsets.symmetric(
                        vertical: 1.v,
                      ),
                      decoration: AppDecoration.fillBlue.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10,
                      ),
                      child: Center(
                        child: Text(
                          widget.smallPill,
                          style: CustomTextStyles.labelLargeBlue300,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.v),
                CustomElevatedButton(
                  onPressed: () {
                    menuScreenController.addToCart(widget.dataPopular!);
                  },
                  width: 160.h,
                  text: "Add to cart".tr,
                  leftIcon: Container(
                    margin: EdgeInsets.only(right: 8.h),
                    child: CustomImageView(
                      color: appTheme.whiteA700,
                      imagePath: ImageConstant.imgNavCart,
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                    ),
                  ),
                  buttonStyle: CustomButtonStyles.fillOrange,
                  buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
