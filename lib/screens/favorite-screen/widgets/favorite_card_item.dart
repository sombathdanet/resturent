import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/screens/menu-screen/controller/menu_controller.dart';
import '../model/favorite_card_item_model.dart';
import '../../../../widgets/menu_widget.dart';
import '../controller/favorite_controller.dart';

class FavoriteItemCard extends StatelessWidget {
  FavoriteItemCard({
    Key? key,
  }) : super(
          key: key,
        );

  final FavoriteController controller = Get.find();
  final MenuScreenController menuScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuScreenController>(
      builder:(_) => SizedBox(
        height: 336.v,
        child:ListView.separated(
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
            itemCount: menuScreenController.listSearch.length,
            itemBuilder: (context, index) {
              FavoriteCardItemModel model = controller.favoriteModelObj.value.favoriteItemList.value[0];
              final list = menuScreenController.listSearch[index];
              return MenuCardItemWidget(
                dataPopular: list,
                title: list.name!,
                price: list.price!.toString(),
                discountPrice: list.discount.toString(),
                offerPercentage: model.offer!.value,
                imagePath: list.foodImage ?? model.image!.value,
                smallPill: model.smallPill!.value,
              );
            },
          ),
        ),
    );
  }
}
