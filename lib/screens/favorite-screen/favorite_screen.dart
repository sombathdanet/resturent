import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/components/app_bar/appbar_title.dart';
import 'package:restaurant_app/components/app_bar/custom_app_bar.dart';
import 'package:restaurant_app/components/custom_field_view.dart';
import 'package:restaurant_app/components/custom_heading.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/screens/favorite-screen/controller/favorite_controller.dart';
import 'package:restaurant_app/screens/favorite-screen/widgets/favorite_card_item.dart';
import 'package:restaurant_app/screens/menu-screen/controller/menu_controller.dart';

import '../../components/custom_image_view.dart';
import '../../constants/image_constant.dart';
import '../../themes/theme_helper.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: GetBuilder<MenuScreenController>(builder:(_) =>_.getListDataPopular.isNotEmpty? _buildBody(_):_buildEmptyFavorite(),),
    );
  }

  Widget _buildBody(MenuScreenController menuScreenController) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
          child: CustomFieldView(
            onChanged: (value){
              menuScreenController.search(value);
            },
            hintText: "Type a dish or cuisine".tr,
            prefix: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16 .h,
              ),
              child: Icon(
                Icons.search,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ),
        SizedBox(height: 12.v),
        const CustomTitleHeading(
          text: "My Favorite",
        ),
        SizedBox(height: 12.v),
        Expanded(
          child: FavoriteItemCard(),
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
          text: "Favorite".tr,
        ),
      ),
      styleType: Style.bgFill,
    );
  }
  Widget _buildEmptyFavorite(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          alignment: Alignment.center,
          imagePath: ImageConstant.no_favorite,
          width: 300,
        ),
        SizedBox(
            width: 300.h,
            child: Text("You've not add favorite yet! ",style: theme.textTheme.titleLarge,textAlign: TextAlign.center,))
      ],
    );
  }
  /// Navigates to the previous screen.
  onTapVector() {
    Get.back();
  }
}