import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../../constants/image_constant.dart';

class FastFoodModel {
  FastFoodModel({
    this.image,
    this.productName,
    this.currentPrice,
    this.previousPrice,
    this.offer,
    this.smallPill,
    this.category,
    this.id,
  }) {
    image = image ?? Rx(ImageConstant.imgMuttonLambBir);
    productName = productName ?? Rx("Hyderabadi Biryani");
    currentPrice = currentPrice ?? Rx("299");
    previousPrice = previousPrice ?? Rx("399");
    offer = offer ?? Rx("20% OFF");
    category = category ?? Rx("Main Course");
    smallPill = smallPill ?? Rx("Chef Pick");
    id = id ?? Rx("");
  }

  Rx<String>? image;

  Rx<String>? productName;

  Rx<String>? currentPrice;

  Rx<String>? previousPrice;

  Rx<String>? offer;
  Rx<String>? category;

  Rx<String>? smallPill;

  Rx<String>? id;
}
