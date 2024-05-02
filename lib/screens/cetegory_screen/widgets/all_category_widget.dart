import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/components/custom_text_button.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/routes/app_routes.dart';
import 'package:restaurant_app/screens/home_screen/controller/home_page_controller.dart';
import 'package:restaurant_app/screens/menu-screen/controller/menu_controller.dart';
import 'package:restaurant_app/themes/theme_helper.dart';

import '../controller/category_controller.dart';
import '../model/all_category_model.dart';
import '../model/category_model.dart';

class AllCategoryWidget extends StatelessWidget {
  AllCategoryWidget({
    Key? key,
  }) : super(
          key: key,
        );

  final CategoryController controller = Get.put(CategoryController(CategoryModel().obs));
  final homeController = Get.find<HomeController>();
  final MenuScreenController menuController = Get.find<MenuScreenController>();

  @override
  Widget build(BuildContext context) {
    final listLength = menuController.nameOfCategory.length;
    print(menuController.nameOfCategory[0]);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 200.v,
      // color: Colors.blue,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          mainAxisExtent: 150,
        ),
        itemCount: listLength,
        itemBuilder: (context, index) {
          final list = menuController.nameOfCategory[index];
          AllCategoryItemModel model = controller
              .categoryModelObj.value.allCategoryItemList.value[index];
          return CustomTextButton(
            onPressed: (){
              Get.toNamed(AppRoutes.menuScreen,arguments: {'index':index});
            },
            text: list,
            style: TextStyle(
              // overflow: TextOverflow.ellipsis,
              color: appTheme.gray800,
              fontSize: 18.0,
            ),
          );
        },
      ),
    );
  }
}
