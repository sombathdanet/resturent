import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/routes/app_routes.dart';
import 'package:restaurant_app/screens/history_order_screen/controller/history_controller.dart';
import 'package:restaurant_app/screens/home_screen/home_screen_container.dart';
import '../../../components/app_bar/appbar_title.dart';
import '../../../components/app_bar/appbar_title_iconbutton.dart';
import '../../../components/app_bar/custom_app_bar.dart';
import '../../../components/custom_elevated_button.dart';
import '../../../components/custom_image_view.dart';
import '../../../constants/image_constant.dart';
import '../../../themes/app_decoration.dart';
import '../../../themes/custom_button_style.dart';
import '../../../themes/custom_text_style.dart';
import '../../../themes/theme_helper.dart';

class DetailOrder extends StatefulWidget {
  const DetailOrder({super.key});

  @override
  State<DetailOrder> createState() => _DetailOrderState();
}

class _DetailOrderState extends State<DetailOrder> {
  final list  = Get.arguments["user"];
  final HistoryController historyController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    historyController.getDetailOrder(list.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar() ,
      body: GetBuilder<HistoryController>(builder: (controller) =>_buildBody(controller)),
      bottomNavigationBar: _buildBottom() ,
    );
  }

  Widget _buildBody(HistoryController controller){
    final list  = Get.arguments["user"];
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.h,vertical: 16.v),
          width: double.maxFinite,
          height: 160.v,
          decoration: BoxDecoration(
              color: appTheme.whiteA700,
              boxShadow: [AppDecoration.boxShadow],
              borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                margin: EdgeInsets.only(left: 10.h,top: 5.v),
                imagePath: ImageConstant.LOGO,
                width: 90.v,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username :${list.user?.name}",
                          style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14.fSize),
                        ),
                        Text(
                          "Payment : ${list.totalPrice?.toStringAsFixed(2)}\$",
                          style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14.fSize),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Table name : ${list.table!.name}",
                      style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14.fSize),
                    ),
                    Text(
                      "Table no : ${list.table!.id}",
                      style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14.fSize),
                    ),
                    Text(
                      "Total Quantity : ${controller.getTotalQuantity(controller.orderDetail)}",
                      style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14.fSize),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: controller.orderDetail.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              final listOrder = controller.orderDetail[index];
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
                                imagePath:  ImageConstant.imgMuttonLambBir,
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
                            listOrder.food!.name.toString(),
                            style: CustomTextStyles.titleMediumGray800,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      listOrder.quantity.toString(),
                      style: CustomTextStyles.titleSmallGray500,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
PreferredSizeWidget _buildAppBar() {
  return CustomAppBar(
    centerTitle: true,
    leadingWidth: 80.v,
    leading:AppbarTitleIconButton(
        color: appTheme.blue300,
        imagePath: ImageConstant.imgVectorWhiteA700,
        onTap: () {
          onTapVector();
        }),
    title: AppbarTitle(
      text: "Order details".tr,
    ),
  );
}
onTapVector(){
  Get.back();
}
Widget _buildBottom() {
  return SizedBox(
    child: CustomElevatedButton(
      onPressed: (){
        Get.offAll(const HomeContainerScreen());
      },
      margin:  EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.v),
      text: 'Make new order',
      buttonTextStyle: const TextStyle(color: Colors.white),
      buttonStyle: CustomButtonStyles.fillOrange,
    ),
  );
}
