import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/constants/image_constant.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/repository/food_repo.dart';
import 'package:restaurant_app/widgets/category_widget.dart';

import '../controller/home_page_controller.dart';
import '../model/home_page_model.dart';
import '../model/popular_category.dart';

class PopularCategoryCard extends StatelessWidget {
  PopularCategoryCard({
    Key? key,
  }) : super(
          key: key,
        );

  final HomeController controller = Get.put(HomeController(HomePageModel().obs,Get.find(),Get.find()));
  final FoodRepo foodRepo = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155.v,
      child: FutureBuilder(
        future: foodRepo.getFoodByFilter("popular"),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Obx(
              ()=> ListView.separated(
                itemCount:controller.listPopularFood.length,
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
                itemBuilder: (context, index) {
                  final list = controller.listPopularFood[index];
                  return CategoryCardItemWidget(
                    id: list!.id!,
                    title: list.name.toString(),
                    imagePath: list.foodImage ??ImageConstant.imgAtikahAkhtarD,
                    dataPopular: list,
                  );
                },
              ),
            );
          }else{
            return  const Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }
}
