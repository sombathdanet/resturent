import 'package:get/get.dart';

import '../../../../constants/image_constant.dart';

class PopularCategoryItemModel {
  PopularCategoryItemModel({
    this.categoryName,
    this.image,
    this.id,
  }) {
    image = image ?? Rx(ImageConstant.imgAtikahAkhtarD);
    categoryName = categoryName ?? Rx("Biryani");
    id = id ?? Rx("");
  }

  Rx<String>? categoryName;

  Rx<String>? image;

  Rx<String>? id;
}
