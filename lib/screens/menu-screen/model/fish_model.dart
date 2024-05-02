
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../../constants/image_constant.dart';

class FishItemModel {
  FishItemModel({
    this.image,
    this.productName,
    this.currentPrice,
    this.previousPrice,
    this.offer,
    this.productDescription,
    this.reviewScore,
    this.numberOfReviews,
    this.category,
    this.smallPill,
    this.id,
  }) {
    image = image ?? Rx(ImageConstant.imgMuttonLambBir);
    productName = productName ?? Rx("Hyderabadi Biryani");
    currentPrice = currentPrice ?? Rx("299");
    previousPrice = previousPrice ?? Rx("399");
    offer = offer ?? Rx("20% OFF");
    productDescription = productDescription ??
        Rx("Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.");
    reviewScore = reviewScore ?? Rx("5.0");
    numberOfReviews = numberOfReviews ?? Rx("(34)");
    category = category ?? Rx("Main Course");
    smallPill = smallPill ?? Rx("Chef Pick");
    id = id ?? Rx("");
  }

  Rx<String>? image;

  Rx<String>? productName;

  Rx<String>? currentPrice;

  Rx<String>? previousPrice;

  Rx<String>? offer;

  Rx<String>? productDescription;

  Rx<String>? reviewScore;

  Rx<String>? numberOfReviews;

  Rx<String>? category;

  Rx<String>? smallPill;

  Rx<String>? id;
}
