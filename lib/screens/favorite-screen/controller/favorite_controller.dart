import 'package:get/get.dart';
import 'package:restaurant_app/model/food_model/popular_food_model.dart';
import 'package:restaurant_app/screens/menu-screen/controller/menu_controller.dart';

import '../../../repository/food_repo.dart';
import '../model/favorite_model.dart';

class FavoriteController extends GetxController {
  FoodRepo foodRepo;
  FavoriteController(this.favoriteModelObj,this.foodRepo);
  Rx<FavoriteScreenModel> favoriteModelObj;
  final favoriteList = <DataPopular>[].obs;
  final MenuScreenController menuScreenController = Get.find();
  List<DataPopular>  get getListFav{
    return menuScreenController.getListDataPopular;
  }
}
