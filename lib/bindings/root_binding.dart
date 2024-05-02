import 'package:get/get.dart';
import 'package:restaurant_app/repository/cart_repo.dart';
import 'package:restaurant_app/repository/food_repo.dart';
import 'package:restaurant_app/repository/location_repo.dart';
import 'package:restaurant_app/repository/user_repo.dart';
import 'package:restaurant_app/screens/cart_screen/controller/cart_screen_controller.dart';
import 'package:restaurant_app/screens/favorite-screen/controller/favorite_controller.dart';
import 'package:restaurant_app/screens/history_order_screen/controller/history_controller.dart';
import 'package:restaurant_app/screens/location_screen/controller/location_controller.dart';
import 'package:restaurant_app/screens/menu-screen/controller/menu_controller.dart';
import 'package:restaurant_app/screens/user_screen/user_profile_screen/controller/main_profile_controller.dart';

import '../screens/favorite-screen/model/favorite_model.dart';
import '../screens/home_screen/controller/home_page_controller.dart';
import '../screens/home_screen/model/home_page_model.dart';
import '../screens/menu-screen/model/menu_screen_model.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FoodRepo());
    Get.lazyPut(()=>LocationRepo());
    Get.lazyPut(()=>LocationController(locationRepo: Get.find()));
    Get.lazyPut<HomeController>(
        () => HomeController(Rx<HomePageModel>(HomePageModel()),Get.find(),Get.find()));
    Get.lazyPut<FavoriteController>(() => FavoriteController(Rx<FavoriteScreenModel>(FavoriteScreenModel()),Get.find()));
    Get.lazyPut(() => UserRepo());
    Get.lazyPut(() => MainProfileController(userRepo: Get.find()));
    Get.lazyPut(() => CartRepo());
    Get.put(CartScreenController(cartRepo: Get.find()));
    Get.put(MenuScreenController(MenuScreenModel().obs,Get.find()));
    Get.put(FavoriteController(Rx<FavoriteScreenModel>(FavoriteScreenModel()), Get.find()));
    Get.put(HistoryController(foodRepo: Get.find()));
  }
}
