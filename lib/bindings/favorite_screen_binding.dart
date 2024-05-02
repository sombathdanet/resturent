import 'package:get/get.dart';
import 'package:restaurant_app/repository/food_repo.dart';
import 'package:restaurant_app/screens/favorite-screen/controller/favorite_controller.dart';
import '../screens/favorite-screen/model/favorite_model.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FoodRepo());
    Get.put(FavoriteController(Rx<FavoriteScreenModel>(FavoriteScreenModel()), Get.find()));
  }
}
