import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';

import '../model/fast_food_model.dart';
import '../model/menu_screen_model.dart';
import '../../../../widgets/menu_widget.dart';
import '../controller/menu_controller.dart';

class DessertItemCard extends StatelessWidget {
  DessertItemCard({
    Key? key,
  }) : super(
          key: key,
        );

  final MenuScreenController controller =
      Get.put(MenuScreenController(MenuScreenModel().obs,Get.find()));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 336.v,
      child: ListView.separated(
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
        itemCount: controller.menuModelObj.value.fastFoodItemList.value.length,
        itemBuilder: (context, index) {
          FastFoodModel model =
              controller.menuModelObj.value.fastFoodItemList.value[index];
          return MenuCardItemWidget(
            title: model.productName!.value,
            price: model.currentPrice!.value,
            discountPrice: model.previousPrice!.value,
            offerPercentage: model.offer!.value,
            imagePath: model.image!.value,
            smallPill: model.smallPill!.value,
          );
        },
      ),
    );
  }
}
