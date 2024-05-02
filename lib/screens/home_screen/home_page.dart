import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/components/app_bar/appbar_leading_image.dart';
import 'package:restaurant_app/components/app_bar/appbar_subtitle.dart';
import 'package:restaurant_app/components/app_bar/appbar_subtitle_one.dart';
import 'package:restaurant_app/components/app_bar/appbar_title_image.dart';
import 'package:restaurant_app/components/app_bar/appbar_trailing_image.dart';
import 'package:restaurant_app/components/app_bar/custom_app_bar.dart';
import 'package:restaurant_app/components/custom_elevated_button.dart';
import 'package:restaurant_app/components/custom_heading.dart';
import 'package:restaurant_app/components/custom_field_view.dart';
import 'package:restaurant_app/components/custom_text_button.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/screens/home_screen/widgets/delicious_dessert_card.dart';
import 'package:restaurant_app/screens/home_screen/widgets/popular_category_card.dart';
import 'package:restaurant_app/screens/home_screen/widgets/special_product_card.dart';
import 'package:restaurant_app/screens/search_screen/search_screen.dart';
import 'package:restaurant_app/screens/user_screen/user_profile_screen/controller/main_profile_controller.dart';
import 'package:restaurant_app/themes/app_decoration.dart';
import 'package:restaurant_app/themes/custom_button_style.dart';
import 'package:restaurant_app/themes/theme_helper.dart';

import '../../../constants/image_constant.dart';
import '../../components/custom_bottom_bar.dart';
import '../../routes/app_routes.dart';
import '../location_screen/location_screnn.dart';
import 'controller/home_page_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key})
      : super(
          key: key,
        );
  final HomeController controller = Get.find();
  final MainProfileController mainProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    // SizeUtils.width = MediaQuery.of(context).size.width;
    // SizeUtils.height = MediaQuery.of(context).size.height;
    Connectivity  _connectivity = Connectivity();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appTheme.gray5001,
      appBar: _buildAppBar(context),
        body: _buildBody(),
    );
  }

  SizedBox _buildBody() {
    return SizedBox(
      width: SizeUtils.width,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20.v),
        child: Padding(
          padding: EdgeInsets.only(bottom: 5.v),
          child: Column(
            children: [
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
              SizedBox(height: 20.v),
              _buildOfferSection(),
              SizedBox(height: 20.v),
              CustomTitleHeading(
                text: 'Popular Categories',
                textButton: CustomTextButton(
                  onPressed: () {
                    controller.routeToCategoryScreen();
                  },
                ),
              ),
              Obx(()=> controller.isLoading.value?PopularCategoryCard():const CircularProgressIndicator()),
              CustomTitleHeading(
                text: "Today's Special",
                textButton: CustomTextButton(
                  onPressed: () {
                    controller.routeToCategoryScreen();
                  },
                ),
              ),
              Obx(()=> controller.isLoadings.value?SpecialProductItemCard():const CircularProgressIndicator()),
              CustomTitleHeading(
                text: 'Delicious Dessert',
                textButton: CustomTextButton(
                  onPressed: () {
                    controller.routeToCategoryScreen();
                  },
                ),
              ),
              Obx(()=> controller.isLoadings.value?DeliciousDessertItemCard():const CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildOrderButton() {
    return CustomElevatedButton(
      height: 39.v,
      width: 150.h,
      text: "ORDER NOW".tr,
      buttonStyle: CustomButtonStyles.fillWhiteA,
    );
  }

  /// Section Widget
  Widget _buildOfferSection() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 35.v,
      ),
      decoration: AppDecoration.gradientOrangeToPink.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          Text(
            "Up to 40 OFF".tr,
            style: theme.textTheme.headlineMedium,
          ),
          SizedBox(height: 4.v),
          Text(
            "ON YOUR FIRST ORDER".tr.toUpperCase(),
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 10.v),
          _buildOrderButton(),
        ],
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar(BuildContext context) {
  MainProfileController mainProfileController = Get.find();
  HomeController homeController = Get.find();
  return  CustomAppBar(
    leadingWidth: 200.h,
    leading: InkWell(
      onTap: ()=> displayBottomSheet(context, homeController.locationList),
      child: Row(
        children: [
          AppbarLeadingImage(
            imagePath: ImageConstant.imgLinkedin,
            margin: EdgeInsets.only(
              left: 12.h,
              top: 10.v,
              bottom: 17.v,
            ),
          ),
        Obx(
            ()=> mainProfileController.isLoading.value? Padding(
            padding: EdgeInsets.only(left: 12.h,top: 5.v),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AppbarSubtitle(
                          text: homeController.current.value!.location!.tr,
                        ),
                      AppbarTitleImage(
                        imagePath: ImageConstant.imgArrowDown,
                        margin: EdgeInsets.only(
                          left: 3.h,
                        ),
                      ),
                    ],
                  ),
                 AppbarSubtitleOne(
                      text: homeController.current.value!.name!.tr,
                      margin: EdgeInsets.only(right: 37.h),
                    ),
                ],
              ),
            ),
          ): Container(),
        )
        ],
      ),
    ),
    actions: [
     GestureDetector(
        onTap: ()=>Get.toNamed(AppRoutes.mainProfileScreen),
        child: Obx(
        ()=> mainProfileController.isLoading.value?Container(
            margin: EdgeInsets.fromLTRB(16.h, 12.v, 16.h, 11.v),
            child: CircleAvatar(
               backgroundImage:CachedNetworkImageProvider(mainProfileController.userProfile.value!.data!.avatar.toString()) ,
              ),
          ):Container(),
        ),
      ),
    ],
  );
}
// class InternetConnectivityWidget extends StatelessWidget{
//   final AsyncSnapshot<List<ConnectivityResult>> snapshot;
//   final Widget widget;
//   const InternetConnectivityWidget({super.key,
//     required this.snapshot,
//     required this.widget,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     switch(snapshot.connectionState){
//       case ConnectionState.active:
//         final state = snapshot.data;
//       switch (state){
//         case ConnectivityResult.none:
//           return Text("has not Internet connect ted");
//         default:
//           return widget;
//       }
//       default:
//        return Text("");
//     }
//   }
// }