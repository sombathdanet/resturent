import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/widgets/product_widget.dart';

import '../controller/home_page_controller.dart';
import '../model/home_page_model.dart';
import '../model/product_item_model.dart';

class DeliciousDessertItemCard extends StatelessWidget {
  DeliciousDessertItemCard({
    Key? key,
  }) : super(
          key: key,
        );

  final HomeController controller =
      Get.put(HomeController(HomePageModel().obs,Get.find(),Get.find()));
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final listL = controller.listAllFood.length;
    return SizedBox(
      height: 310.v,
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
        itemCount:
        listL,
        itemBuilder: (context, index) {
          final list = controller.listAllFood[index];
          ProductItemModel model = controller
              .homeModelObj.value.deliciousDessertItemList.value[0];
          return ProductCartItemWidget(
            onTap: (){
              controller.routeToSpecialProductDetail(model,list.id!,list);
            },
            title: list.name.toString(),
            description: list.description.toString(),
            price: list.price.toString(),
            discountPrice: list.discount.toString(),
            offerPercentage: model.offer!.value,
            imagePath: list.foodImage ??model.image!.value,
            dataPopular: list,
          );
        },
      ),
    );
  }
}
