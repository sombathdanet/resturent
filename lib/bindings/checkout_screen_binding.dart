import 'package:get/get.dart';
import 'package:restaurant_app/repository/food_repo.dart';
import 'package:restaurant_app/screens/checkout_screen/controller/checkout_screen_controller.dart';
import 'package:restaurant_app/screens/history_order_screen/controller/history_controller.dart';


class CheckOutScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>CheckOutController());
  }
}
