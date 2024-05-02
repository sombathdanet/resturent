import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/components/custom_field_view.dart';
import 'package:restaurant_app/components/custom_image_view.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/screens/home_screen/controller/home_page_controller.dart';
import 'package:restaurant_app/themes/theme_helper.dart';

import '../../components/app_bar/appbar_title_iconbutton.dart';
import '../../constants/image_constant.dart';
import '../../widgets/menu_widget.dart';
import 'controller/search_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchScreenController>();
    return Scaffold(
      appBar: AppBar(
        leading: AppbarTitleIconButton(
            color: appTheme.blue300,
            imagePath: ImageConstant.imgVectorWhiteA700,
            margin: EdgeInsets.only(top: 1.v, bottom: 3.v),
            onTap: () {
              onTapVector();
            }),
        centerTitle: true,
        title: Text(
          "Search",
          style: theme.textTheme.titleLarge!.copyWith(
            color: appTheme.black900,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: appTheme.gray50,
      body: SizedBox(
        width: SizeUtils.width,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: CustomFieldView(
              onChanged: (value) {
                controller.searchUpdate(value);
              },
              hintText: "Search by keyboard or categories".tr,
              prefix: Padding(
                padding: EdgeInsets.only(
                  right: 16.h,
                  left: 16.h,
                ),
                child:  Icon(
                  Icons.search,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ),
          Expanded(child: _searchBody())
        ]),
      ),
    );
  }
}

Widget _searchBody() {
  final controller = Get.find<SearchScreenController>();
  final homeController = Get.find<HomeController>();
  return Obx(
    () => homeController.isLoading.value
        ? ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
            scrollDirection: Axis.vertical,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 13.h,
              );
            },
            itemCount: controller.listForSearch.length,
            itemBuilder: (context, index) {
              final list = controller.listForSearch[index];
              return MenuCardItemWidget(
                dataPopular: list,
                title: list.name!,
                price: list.price.toString(),
                discountPrice: list.discount.toString(),
                offerPercentage: list.description!,
                imagePath: list.foodImage ?? ImageConstant.imageBurger,
                smallPill: list.code.toString(),
              );
            },
          )
        : const CircularProgressIndicator(),
  );
}

onTapVector() {
  Get.back();
}
