import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/components/app_bar/appbar_title.dart';
import 'package:restaurant_app/components/app_bar/appbar_title_iconbutton.dart';
import 'package:restaurant_app/components/app_bar/custom_app_bar.dart';
import 'package:restaurant_app/components/custom_heading.dart';
import 'package:restaurant_app/components/custom_text_button.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/screens/cetegory_screen/widgets/all_category_widget.dart';
import 'package:restaurant_app/screens/cetegory_screen/widgets/most_popular_card.dart';
import 'package:restaurant_app/screens/cetegory_screen/widgets/trending_card.dart';
import 'package:restaurant_app/screens/home_screen/controller/home_page_controller.dart';
import 'package:restaurant_app/themes/theme_helper.dart';

import '../../../constants/image_constant.dart';
import '../home_screen/widgets/delicious_dessert_card.dart';
import '../home_screen/widgets/popular_category_card.dart';
import '../home_screen/widgets/special_product_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  SizedBox _buildBody() {
    final HomeController controller = Get.find();
    return SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTitleHeading(
                text: 'Most Popular',
              ),
              SizedBox(height: 10.v,),
             // SizedBox(height: 10.v),
              Obx(()=> controller.isLoading.value?PopularCategoryCard():const CircularProgressIndicator()),
              const CustomTitleHeading(
                text: "Today's Special",
              ),
              Obx(()=> controller.isLoadings.value?SpecialProductItemCard():const CircularProgressIndicator()),
              const CustomTitleHeading(
                text: 'Delicious Dessert',
              ),
              SizedBox(height: 10.v,),
              Obx(()=> controller.isLoadings.value?DeliciousDessertItemCard():const CircularProgressIndicator()),
            ],
          ),
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
        text: "Categories".tr
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapVector() {
    Get.back();
  }
}
