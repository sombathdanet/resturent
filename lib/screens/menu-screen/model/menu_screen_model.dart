import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../../constants/image_constant.dart';
import 'fast_food_model.dart';
import 'fish_model.dart';

class MenuScreenModel {
  Rx<List<FastFoodModel>> fastFoodItemList = Rx(
    [
      FastFoodModel(
        image: ImageConstant.imageBurger.obs,
        productName: "Cheese Burger".obs,
        currentPrice: "299".obs,
        previousPrice: "399".obs,
        offer: "20% OFF".obs,
        smallPill: "CHEF PICK".obs,
      ),
      FastFoodModel(
        image: ImageConstant.imagePizza.obs,
        productName: "Pepper Pizza".obs,
        currentPrice: "299".obs,
        previousPrice: "399".obs,
        offer: "14% OFF".obs,
        smallPill: "TOP SELLING".obs,
      ),
      FastFoodModel(
        image: ImageConstant.imagePizza.obs,
        productName: "Pepper Pizza".obs,
        currentPrice: "299".obs,
        previousPrice: "399".obs,
        offer: "14% OFF".obs,
        smallPill: "TOP SELLING".obs,
      ), FastFoodModel(
      image: ImageConstant.imagePizza.obs,
      productName: "Pepper Pizza".obs,
      currentPrice: "299".obs,
      previousPrice: "399".obs,
      offer: "14% OFF".obs,
      smallPill: "TOP SELLING".obs,
    ),
    ],
  );
  Rx<List<FishItemModel>> fishItemList = Rx(
    [
      FishItemModel(
        image: ImageConstant.imgMuttonLambBir.obs,
        productName: "Hyderabadi Biryani".obs,
        currentPrice: "299".obs,
        previousPrice: "399".obs,
        offer: "20% OFF".obs,
        productDescription:
        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint."
            .obs,
        reviewScore: "5.0".obs,
        numberOfReviews: "(34)".obs,
        category: "Main Course".obs,
        smallPill: "Chef Pick".obs,
      ),
      FishItemModel(
        image: ImageConstant.imgMuttonLambBir.obs,
        productName: "Hyderabadi Biryani".obs,
        currentPrice: "299".obs,
        previousPrice: "399".obs,
        offer: "20% OFF".obs,
        productDescription:
        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint."
            .obs,
        reviewScore: "5.0".obs,
        numberOfReviews: "(34)".obs,
        category: "Main Course".obs,
        smallPill: "Chef Pick".obs,
      ),
    ],
  );
}
