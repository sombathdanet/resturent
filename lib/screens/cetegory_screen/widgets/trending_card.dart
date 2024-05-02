import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/find_locale.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/screens/home_screen/controller/home_page_controller.dart';
import 'package:restaurant_app/screens/home_screen/model/product_item_model.dart';
import 'package:restaurant_app/widgets/product_widget.dart';

import '../../../model/food_model/popular_food_model.dart';
import '../controller/category_controller.dart';
import '../model/category_model.dart';
import '../model/trending_model.dart';

class TrendingItemCard extends StatelessWidget {
  TrendingItemCard({
    Key? key,
  }) : super(
          key: key,
        );

  final CategoryController controller = Get.put(CategoryController(CategoryModel().obs));
  final HomeController homeController = Get.find();
  double calculateDiscount(double originalPrice, double discountedPrice) {
    // Calculate the difference between the original price and discounted price
    double discountAmount = originalPrice - discountedPrice;

    // Calculate the percentage discount
    double discountPercentage = (discountAmount / originalPrice) * 100;

    // Round the result to two decimal places
    return discountPercentage.roundToDouble();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 336.v,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 13.h,
            );
          },
          itemCount:homeController.listAllFood.length,
          itemBuilder: (context, index) {
            ProductItemModel models = homeController.homeModelObj.value.deliciousDessertItemList.value[0];
            final list = homeController.listAllFood[index];
            return ProductCartItemWidget(
              onTap: (){
                homeController.routeToSpecialProductDetail(models,list.id!,list);
              },
              title: list.name!,
              description: list.description!,
              price: list.price!.toString(),
              discountPrice: list.discount!.toString(),
              offerPercentage: calculateDiscount(list.price!,list.discount!).toString(),
              imagePath: models.image!.value,
              dataPopular: list,
            );
          },
        ),
      );
  }
}
