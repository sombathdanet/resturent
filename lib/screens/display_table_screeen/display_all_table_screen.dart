import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant_app/components/custom_image_view.dart';
import 'package:restaurant_app/constants/image_constant.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/routes/app_routes.dart';
import 'package:restaurant_app/screens/cart_screen/controller/cart_screen_controller.dart';
import 'package:restaurant_app/screens/display_table_screeen/controller/table_controller.dart';
import 'package:restaurant_app/screens/user_screen/user_profile_screen/controller/main_profile_controller.dart';
import 'package:restaurant_app/themes/theme_helper.dart';

import '../../components/app_bar/appbar_title.dart';
import '../../components/app_bar/appbar_title_iconbutton.dart';
import '../../components/app_bar/custom_app_bar.dart';
import '../../model/food_model/cart_model.dart';

class AllTableScreen extends StatelessWidget {
  const AllTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(),
        );
  }

  Widget _buildBody() {
    TableController tabController = Get.find();
    CartScreenController cartScreenController = Get.find();
    PrimaryColors colors = PrimaryColors();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            height: 100.v,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5)),
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(5, 0))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgBurger,
                  width: 50.v,
                  color: colors.orange800,
                ),
                SizedBox(
                    width: 130.h,
                    child: Text("Running Order",
                        style: theme.textTheme.displayMedium
                            ?.copyWith(fontSize: 15))),
                Container(
                  height: 50.h,
                  width: 50.v,
                  decoration: BoxDecoration(
                    color: colors.orange800,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(cartScreenController.getCartList.length.toString(),
                              style: theme.textTheme.displayMedium?.copyWith(fontSize: 15.adaptSize,color: Colors.white)),
                      ],
                    ),
                  ),
                )
              ],
            )),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          height: 100.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5)),
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(5, 0))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgIcoutlinetablerestaurant,
                width: 60.v,
                color: colors.orange800,
              ),
              SizedBox(
                width: 130.h,
                child: Text("Table Status",
                    style:
                        theme.textTheme.displayMedium?.copyWith(fontSize: 15)),
              ),
              Container(
                height: 50.h,
                width: 50.v,
                decoration: BoxDecoration(
                  color: colors.orange800,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => Text(
                            tabController.getAvailableTable.length.toString(),
                            style: theme.textTheme.displayMedium
                                ?.copyWith(fontSize: 15.adaptSize,color: Colors.white)),
                      ),
                      Text("/",
                          style: theme.textTheme.displayMedium
                              ?.copyWith(fontSize: 15.adaptSize,color: Colors.white)),
                      Obx(
                        () => Text(tabController.tableData.length.toString(),
                            style: theme.textTheme.displayMedium
                                ?.copyWith(fontSize: 15.adaptSize,color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildSelectTable(),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 80.h,
      centerTitle: true,
      leadingWidth: 80.v,
      leading:AppbarTitleIconButton(
          color: appTheme.blue300,
          imagePath: ImageConstant.imgVectorWhiteA700,
          margin: EdgeInsets.only(top: 1.v, bottom: 3.v),
          onTap: () {
            Get.back();
          }),
      title: AppbarTitle(
        text: "All table".tr,
      ),
    );
  }

  Widget _buildSelectTable() {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            "You Orders",
            style: theme.textTheme.displayMedium?.copyWith(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 60.v,
          width: double.maxFinite,
          child: Column(
            children: [
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Table No",
                    style:
                        theme.textTheme.displayMedium?.copyWith(fontSize: 14.v),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Text(
                    "Table status",
                    style:
                        theme.textTheme.displayMedium?.copyWith(fontSize: 14.v),
                  ),
                  Text(
                    "Seat capacity",
                    style:
                        theme.textTheme.displayMedium?.copyWith(fontSize: 14.v),
                  ),
                ],
              ),
              const Divider(),
            ],
          ),
        ),
        _buildListView()
      ],
    ));
  }

  Widget _buildListView() {
    TableController tabController = Get.find();
    PrimaryColors colors = PrimaryColors();
    return Expanded(
      child: Obx(
        () => ListView.separated(
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 5.v,
            );
          },
          itemCount: tabController.tableData.length,
          itemBuilder: (context, index) {
            final list = tabController.tableData[index];
            return InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.checkoutScreen,arguments: {'tableID':list.id});
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                height: 100.v,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5)),
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(5, 0))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgIcoutlinetablerestaurant,
                          width: 60.v,
                          color: colors.orange800,
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        Text(
                          "${list!.id}",
                          style: theme.textTheme.displayMedium
                              ?.copyWith(fontSize: 14.v),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100.h,
                      child: Text(list.status ?? "no status",
                          style: theme.textTheme.displayMedium
                              ?.copyWith(fontSize: 15)),
                    ),
                    Text(list.seatCapacity ?? "0",
                        style: theme.textTheme.displayMedium
                            ?.copyWith(fontSize: 15)),
                    const Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
