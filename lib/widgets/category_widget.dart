import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/model/food_model/popular_food_model.dart';
import 'package:restaurant_app/screens/home_screen/controller/home_page_controller.dart';

import '../../../../components/custom_image_view.dart';
import '../../../../themes/theme_helper.dart';
import '../screens/home_screen/model/product_item_model.dart';

class CategoryCardItemWidget extends StatelessWidget {
  const CategoryCardItemWidget({
    super.key,
    required this.title, required this.imagePath,
    required this.id,
    this.dataPopular,
  });

  final String title;
  final String imagePath;
  final int id;
  final DataPopular? dataPopular;

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return SizedBox(
      width: 84.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.v),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              onTap: (){
                ProductItemModel model = homeController.homeModelObj.value.deliciousDessertItemList.value[0];
                homeController.routeToSpecialProductDetail(model, id, dataPopular!);
              },
              imagePath: imagePath,
              height: 88.v,
              width: 84.h,
              radius: BorderRadius.circular(
                44.h,
              ),
            ),
            SizedBox(height: 10.v),
            Center(
              child: Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
