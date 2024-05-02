import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant_app/components/app_bar/appbar_title.dart';
import 'package:restaurant_app/components/app_bar/appbar_title_iconbutton.dart';
import 'package:restaurant_app/components/app_bar/custom_app_bar.dart';
import 'package:restaurant_app/components/custom_elevated_button.dart';
import 'package:restaurant_app/components/custom_icon_button.dart';
import 'package:restaurant_app/components/custom_image_view.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/screens/cart_screen/controller/cart_screen_controller.dart';
import 'package:restaurant_app/screens/menu-screen/controller/menu_controller.dart';
import 'package:restaurant_app/themes/app_decoration.dart';
import 'package:restaurant_app/themes/custom_button_style.dart';
import 'package:restaurant_app/themes/custom_text_style.dart';
import 'package:restaurant_app/themes/theme_helper.dart';

import '../../../constants/image_constant.dart';
import '../cart_screen/cart_screen.dart';
import '../home_screen/model/product_item_model.dart';
import 'detail_screen_controller.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final DetailScreenController controller = Get.find();
  final CartScreenController cartController = Get.find();
  final ProductItemModel item = Get.arguments["item"];
  final id = Get.arguments['id'];
  final list = Get.arguments["list"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final MenuScreenController menuScreenController = Get.find();
    return GetBuilder<MenuScreenController>(
      builder:(_)=> SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: appTheme.deepPurple100,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Obx(
                      (){
                        final list = controller.detailFood.value;
                        return CustomImageView(
                          fit: BoxFit.cover,
                          width: double.maxFinite,
                          imagePath: list?.data?.foodImage ?? ImageConstant.imgMuttonLambBir,
                        );
                       }
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 7.v,
                          right: 8.h,
                        ),
                        child: CustomIconButton(
                          onTap: (){
                            menuScreenController.addToFavorite(list);
                          },
                          borderRadius: BorderRadiusStyle.roundedBorder15,
                          height: 32.adaptSize,
                          width: 32.adaptSize,
                          padding: EdgeInsets.all(8.h),
                          alignment: Alignment.topRight,
                          child: CustomImageView(
                            color:  menuScreenController.isFav(list!)?appTheme.orange800:appTheme.black900,
                            imagePath: menuScreenController.isFav(list!)?ImageConstant.imgOutline24pxNewHeart:ImageConstant.imgOutline24pxHeart,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 78.h,
                        decoration: AppDecoration.fillGreen.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
                        ),
                        child: Text(
                          "BESTSELLER",
                          style: CustomTextStyles.labelLargeGreen500,
                        ),
                      ),
                      SizedBox(height: 16.v),
                      Obx(
                          (){
                            final list = controller.detailFood.value;
                            return controller.isLoading.value? Text(
                              list!.data!.name.toString(),
                          style: theme.textTheme.titleLarge,
                        ):const Text("");}
                      ),
                      SizedBox(height: 1.v),
                      SizedBox(height: 5.v),
                      SizedBox(
                        width: 248.h,
                        child: Obx(() {
                          final list = controller.detailFood.value;
                          return   controller.isLoading.value? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (list != null && list.data != null) Text(
                                list.data!.description.toString(),
                                maxLines: controller.isExpanded.value ? 5 : 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.bodySmallGray500.copyWith(
                                  height: 1.33,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => controller.toggleExpanded(),
                                child: Text(
                                  controller.isExpanded.value
                                      ? "Read Less"
                                      : "Read More",
                                  style: CustomTextStyles.labelLargeBlack900,
                                ),
                              ),
                            ],
                          ):const Column();
                        }),
                      ),
                      const Divider(),
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
                            decoration: AppDecoration.fillGreen.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10,
                            ),
                            child: Text(
                              "CHEF PICK",
                              style: CustomTextStyles.labelLargeGreen500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 13.v),
                      const Divider(),
                      SizedBox(height: 25.v),
                      Text(
                        "AddOn",
                        style: CustomTextStyles.titleLargeGrey800,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "French fries",
                            style: CustomTextStyles.titleMediumGray800,
                          ),
                          Row(
                            children: [
                              Obx(
                                    () => Checkbox(
                                  value: controller.isChecked.value,
                                  onChanged: (bool? value) {
                                    if (value != null) {
                                      controller.toggleCheckbox(value);
                                    }
                                  },
                                ),
                              ),
                              Text(
                                "99",
                                style: CustomTextStyles.titleMediumGray800,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 25.v),
                      const Divider(),
                      SizedBox(height: 32.v),
                      Obx(
                        ()=> Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 130.v,
                              height: 48.v,
                              padding: EdgeInsets.symmetric(
                                horizontal: 11.h,
                                vertical: 6.v,
                              ),
                              decoration: AppDecoration.fillOrange.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder5,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomIconButton(
                                    onTap: () {
                                      controller.decrease(controller.detailFood.value!.data!.id!);
                                    },
                                    decoration: const BoxDecoration(),
                                    height: 24.adaptSize,
                                    width: 24.adaptSize,
                                    padding: EdgeInsets.all(1.h),
                                    child: CustomImageView(
                                      color: appTheme.whiteA700,
                                      imagePath:
                                      ImageConstant.imgOutline24pxMinusCircle,
                                    ),
                                  ),
                                   Text(
                                      controller.quantity.toString(),
                                      style: theme.textTheme.titleLarge
                                          ?.copyWith(color: appTheme.whiteA700),
                                    ),
                                  CustomIconButton(
                                    onTap: () {
                                      controller.increase(controller.detailFood.value!.data!.id!);
                                    },
                                    decoration: const BoxDecoration(),
                                    height: 24.adaptSize,
                                    width: 24.adaptSize,
                                    child: CustomImageView(
                                      color: appTheme.whiteA700,
                                      imagePath:
                                      ImageConstant.imgOutline24pxPlusCircle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomElevatedButton(
                              onPressed: () {
                                cartController.addToCart(controller.quantity.value, controller.detailFood.value!);
                                Get.bottomSheet(
                                  const CartScreen(),
                                  clipBehavior: Clip.antiAlias,
                                  isDismissible: true,
                                  enableDrag: true,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                );

                              },
                              width: 155.h,
                              text: "Add".tr,
                              leftIcon: Container(
                                margin: EdgeInsets.only(right: 8.h),
                                child: CustomImageView(
                                  color: appTheme.whiteA700,
                                  imagePath: ImageConstant.imgNavCart,
                                  height: 18.adaptSize,
                                  width: 18.adaptSize,
                                ),
                              ),
                              buttonStyle: CustomButtonStyles.fillOrangeRadius5,
                              buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 80.h,
      centerTitle: true,
      leadingWidth: 40,
      leading:AppbarTitleIconButton(
          color: appTheme.blue300,
          imagePath: ImageConstant.imgVectorWhiteA700,
          onTap: () {
            onTapVector();
          }),
      title: Obx(
        ()=>AppbarTitle(
          text: controller.detailFood.value!.data!.name!,
        ),
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapVector() {
    Get.back();
  }
}
