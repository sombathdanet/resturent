import 'package:get/get.dart';
import 'package:restaurant_app/repository/cart_repo.dart';
import 'package:restaurant_app/repository/food_repo.dart';
import 'package:restaurant_app/screens/cart_screen/controller/cart_screen_controller.dart';

import '../screens/detail_screen/detail_screen_controller.dart';

class DetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FoodRepo());
    Get.put(CartRepo());
    Get.lazyPut<DetailScreenController>(() => DetailScreenController(foodRepo: Get.find(), cartRepo: Get.find()));
    Get.lazyPut(() => CartScreenController(cartRepo: Get.find()));
  }
}
