import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/screens/menu-screen/model/fish_model.dart';
import '../../../constants/image_constant.dart';
import '../../home_screen/controller/home_page_controller.dart';
import '../model/fast_food_model.dart';
import '../model/menu_screen_model.dart';
import '../../../../widgets/menu_widget.dart';
import '../controller/menu_controller.dart';

class FastFodItemCard extends StatefulWidget {
  const FastFodItemCard({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<FastFodItemCard> createState() => _FastFodItemCardState();
}

class _FastFodItemCardState extends State<FastFodItemCard> {
  final MenuScreenController controller = Get.put(MenuScreenController(MenuScreenModel().obs,Get.find()));

  final  homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 336.v,
      child: Obx(
          ()=> ListView.separated(
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
          itemCount: controller.newListCategory.length,
          itemBuilder: (context, index) {
            final list =  controller.newListCategory[index];
            FishItemModel model = controller.menuModelObj.value.fishItemList.value[0];
            return MenuCardItemWidget(
              dataPopular: list,
              title:list.name!,
              price: list.price.toString(),
              discountPrice: list.discount.toString(),
              offerPercentage: model.offer.toString(),
              imagePath: list.foodImage ?? ImageConstant.imageBurger,
              smallPill: model.smallPill.toString(),
            );
          },
        ),
      ),
    );
  }
}
