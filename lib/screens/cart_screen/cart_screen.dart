import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/components/custom_elevated_button.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/routes/app_routes.dart';
import 'package:restaurant_app/screens/cart_screen/controller/cart_screen_controller.dart';
import 'package:restaurant_app/themes/app_decoration.dart';
import 'package:restaurant_app/themes/custom_button_style.dart';
import '../../../components/custom_image_view.dart';
import '../../../constants/image_constant.dart';
import '../../../themes/custom_text_style.dart';
import '../../../themes/theme_helper.dart';
import '../../components/app_bar/appbar_title.dart';
import '../../components/app_bar/custom_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: GetBuilder<CartScreenController>(builder: (controller)=> controller.getCartList.isNotEmpty?Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 16 .h,
          vertical: 20.v,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.getCartList.length ?? 1,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 16.v, vertical: 8.v),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 70.v,
                              width: 70.h,
                              decoration: BoxDecoration(
                                color: appTheme.deepPurple100,
                                borderRadius:
                                BorderRadiusStyle.roundedBorder10,
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CustomImageView(
                                    imagePath:  controller.getCartList[index].imgUrl ?? ImageConstant.imgMuttonLambBir,
                                    radius: BorderRadiusStyle.roundedBorder10,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 14.h),
                            SizedBox(
                              width: 100.h,
                              child: Text(
                                controller.getCartList[index].name.toString(),
                                style: CustomTextStyles.titleMediumGray800,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            controller.decrease(index);
                          },
                            child:  Icon(Icons.remove,
                              color: appTheme.gray500,
                            )),
                        Text(
                          controller.getCartList[index].qty.toString(),
                          style: CustomTextStyles.titleSmallGray500,
                        ),
                        GestureDetector(
                            onTap: (){
                              controller.addToCart(1,controller.getCartList[index].detailModel);
                            },
                            child:  Icon(Icons.add,
                              color: appTheme.gray500,)),
                        Text(
                          controller.getCartList[index].totalAmount.toString(),
                          style: CustomTextStyles.titleMediumGray800,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "TOTAL",
                      style: CustomTextStyles.titleMediumGray800,
                    ),
                    Text(
                      "\$${controller.getTotalAmount}",
                      style: CustomTextStyles.titleLargeBlack900,
                    ),
                  ],
                ),
                CustomElevatedButton(
                  onPressed: (){
                    Get.toNamed(AppRoutes.tableScreen);
                  },
                  width: 180.h,
                  text: "Select Table".tr,
                  rightIcon: Container(
                    margin: EdgeInsets.only(left: 8.h),
                    child: CustomImageView(
                      color: appTheme.whiteA700,
                      imagePath: ImageConstant.arrowRight,
                      height: 16.adaptSize,
                      width: 16.adaptSize,
                    ),
                  ),
                  buttonStyle: CustomButtonStyles.fillOrange,
                  buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                ),
              ],
            ),
          ],
        ),
      ):buildEmptyCart(),),
    );
  }
}

PreferredSizeWidget _buildAppBar() {
  return CustomAppBar(
    centerTitle: true,
    title: Padding(
      padding: EdgeInsets.only(top: 18.h),
      child: AppbarTitle(
        text: "My Card".tr,
      ),
    ),
    styleType: Style.bgFill,
  );
}

/// Navigates to the previous screen.
onTapVector() {
  Get.back();
}
//build Empty Cart
Widget buildEmptyCart(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CustomImageView(
        alignment: Alignment.center,
        imagePath: ImageConstant.emptyCart,
        width: 300,
      ),
      SizedBox(
        width: 300.h,
          child: Text("You've not order yet!",style: theme.textTheme.titleLarge,textAlign: TextAlign.center,))
    ],
  );
}
