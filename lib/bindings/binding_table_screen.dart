import 'package:get/get.dart';
import 'package:restaurant_app/repository/table_repo.dart';
import 'package:restaurant_app/screens/cart_screen/controller/cart_screen_controller.dart';
import 'package:restaurant_app/screens/display_table_screeen/controller/table_controller.dart';
import 'package:restaurant_app/screens/user_screen/user_profile_screen/controller/main_profile_controller.dart';

import '../repository/food_repo.dart';
import '../screens/history_order_screen/controller/history_controller.dart';


class TableScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>TableRepo());
    Get.lazyPut(()=>FoodRepo());
    Get.lazyPut(()=>HistoryController(foodRepo: Get.find()));
    Get.put(TableController(tableRepo: Get.find()));
    Get.lazyPut(() => MainProfileController(userRepo: Get.find()));
    Get.lazyPut(() => CartScreenController(cartRepo: Get.find()));
  }
}
