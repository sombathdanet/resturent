import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/components/custom_elevated_button.dart';
import 'package:restaurant_app/components/custom_image_view.dart';
import 'package:restaurant_app/constants/image_constant.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/routes/app_routes.dart';
import 'package:restaurant_app/screens/history_order_screen/controller/history_controller.dart';
import 'package:restaurant_app/themes/app_decoration.dart';
import 'package:restaurant_app/themes/theme_helper.dart';

import '../../components/app_bar/appbar_title.dart';
import '../../components/app_bar/custom_app_bar.dart';
import '../../themes/custom_button_style.dart';
import '../../themes/custom_text_style.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body:GetBuilder<HistoryController>(builder:(controller)=> controller.dataOrder.isEmpty ?buildEmptyCart() : _buildBody(context,controller)),
    );
  }
  Widget _buildBody(BuildContext context,HistoryController controller){
    return  ListView.builder(
      itemCount: controller.dataOrder.length,
      itemBuilder: (context,index){
        final list = controller.dataOrder[index];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.v),
          child: Slidable(
          endActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                controller.deleteOrder(list.id!);
              },
              backgroundColor: appTheme.orange800,
              icon: Icons.delete,
            ),
          ],
                  ),
          child: Container(
            width: double.maxFinite,
            height: 160.v,
            decoration: BoxDecoration(
              color: appTheme.whiteA700,
              boxShadow: [AppDecoration.boxShadow],
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  CustomImageView(
                    margin: EdgeInsets.only(left: 16.h,top: 5.v),
                    imagePath: ImageConstant.LOGO,
                    width: 80.v,
                  ),
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     SizedBox(
                       width: 150.h,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             "Username :${list.user?.name}",
                             style: theme.textTheme.bodyMedium,
                             overflow: TextOverflow.ellipsis,
                           ),
                           Text(
                             "Payment : ${list.totalPrice?.toStringAsFixed(2)}\$",
                             style: theme.textTheme.bodyMedium,
                             overflow: TextOverflow.ellipsis,
                           ),
                         ],
                         ),
                     ),
                        CustomElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.detailOrder,arguments: {"user":list});
                      },
                      width: 150.h,
                      text: "View Details".tr,
                      buttonStyle: CustomButtonStyles.fillOrange,
                      buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                    ),
                  ],
                ),SizedBox(height: 14.v,),
                Container(
                  height: 40.v,
                  padding: EdgeInsets.symmetric(horizontal: 12.h),
                  width: double.maxFinite,
                  color: Colors.grey.withOpacity(0.1),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomImageView(
                            width: 30,
                            color: appTheme.gray50001,
                            imagePath: ImageConstant.imgIcoutlinetablerestaurant,
                          ),
                          Text(
                            "Table name : ${list.table!.name}",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 50.h),
                        child: Text(
                          "Table no : ${list.table!.id}",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          ),
        );
      },
    );
  }
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "History order".tr,
      ),
    );
  }
}
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
          child: Text("No Order history",style: theme.textTheme.titleLarge,textAlign: TextAlign.center,))
    ],
  );
}
