import 'package:get/get.dart';

class AllCategoryItemModel {
  AllCategoryItemModel({
    this.categoryName,
    this.id,
  }) {
    categoryName = categoryName ?? Rx("Biryani");
    id = id ?? Rx("");
  }

  Rx<String>? categoryName;


  Rx<String>? id;
}
