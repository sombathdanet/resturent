import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/constants/image_constant.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/screens/home_screen/controller/home_page_controller.dart';
import 'package:restaurant_app/widgets/category_widget.dart';

import '../controller/category_controller.dart';
import '../model/category_model.dart';
import '../model/most_popular_model.dart';

class MostPopularCard extends StatelessWidget {
  MostPopularCard({
    Key? key,
  }) : super(
    key: key,
  );

  final CategoryController controller = Get.put(CategoryController(CategoryModel().obs));
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final categoryLength = homeController.listPopularFood.length;
    return SizedBox(
      height: 180.v,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
            context,
            index,
            ) {
          return SizedBox(
            width: 14.h,
          );
        },
        itemCount: categoryLength,
        itemBuilder: (context, index) {
          final listCategory = homeController.listPopularFood[index];
          return CategoryCardItemWidget(
            title: "hddddddddddddddddddddddd",
            imagePath:listCategory?.foodImage ?? ImageConstant.imgAtikahAkhtarD,
            id: listCategory!.id!,
            dataPopular: listCategory,
          );
        },
      ),
    );
  }
}
