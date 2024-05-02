import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';

import '../controller/menu_controller.dart';
import '../model/fish_model.dart';
import '../model/menu_screen_model.dart';
import '../../../../widgets/menu_widget.dart';

class FishItemCard extends StatelessWidget {
  FishItemCard({
    Key? key,
  }) : super(
          key: key,
        );

  final MenuScreenController controller =
      Get.put(MenuScreenController(MenuScreenModel().obs,Get.find()));

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
      itemCount: controller.menuModelObj.value.fishItemList.value.length,
      itemBuilder: (context, index) {
        FishItemModel model =
            controller.menuModelObj.value.fishItemList.value[index];
        return MenuCardItemWidget(
          title: model.productName!.value,
          price: model.previousPrice!.value,
          discountPrice: model.currentPrice!.value,
          offerPercentage: model.offer!.value,
          imagePath: model.image!.value,
          smallPill: model.smallPill!.value,
        );
      },
    );
  }
}
