import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/widgets/product_widget.dart';

import '../../../constants/image_constant.dart';
import '../controller/home_page_controller.dart';
import '../model/product_item_model.dart';

class SpecialProductItemCard extends StatelessWidget {
  SpecialProductItemCard({
    Key? key,
  }) : super(
          key: key,
        );

  final HomeController controller = Get.find<HomeController>();

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
        itemCount: listL,
        itemBuilder: (context, index) {
          final list = controller.listAllFood[index];
          ProductItemModel model = controller.homeModelObj.value.specialProductItemList.value[0];
          return ProductCartItemWidget(
            onTap: () {
              controller.routeToSpecialProductDetail(model,list.id!.toInt(),list);
            },
            title: list.name!,
            description: list.description!,
            price: list.price.toString(),
            discountPrice: list.discount.toString(),
            offerPercentage: model.offer!.value,
            imagePath:list.foodImage ?? ImageConstant.imgMuttonLambBir,
            dataPopular: list,
          );
        },
      ),
    );
  }
}
