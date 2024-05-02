import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../../constants/image_constant.dart';
import 'favorite_card_item_model.dart';

class FavoriteScreenModel {
  Rx<List<FavoriteCardItemModel>> favoriteItemList = Rx(
    [
      FavoriteCardItemModel(
        image: ImageConstant.imageBurger.obs,
        productName: "Hyderabadi Biryani".obs,
        currentPrice: "299".obs,
        previousPrice: "399".obs,
        offer: "20% OFF".obs,
        reviewScore: "5.0".obs,
        numberOfReviews: "(34)".obs,
        category: "Main Course".obs,
        smallPill: "Chef Pick".obs,
      ),
      FavoriteCardItemModel(
        image: ImageConstant.imgMuttonLambBir.obs,
        productName: "Hyderabadi Biryani".obs,
        currentPrice: "299".obs,
        previousPrice: "399".obs,
        offer: "20% OFF".obs,
        reviewScore: "5.0".obs,
        numberOfReviews: "(34)".obs,
        category: "Main Course".obs,
        smallPill: "Chef Pick".obs,
      ),
    ],
  );
}
