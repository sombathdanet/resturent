import 'package:get/get.dart';
import 'package:restaurant_app/model/food_model/popular_food_model.dart';

import '../../home_screen/controller/home_page_controller.dart';

class SearchScreenController extends GetxController{
  RxList<DataPopular> listForSearch = RxList.empty(growable: true);
  final homeController = Get.find<HomeController>();
  @override
  void onInit(){
    super.onInit();
    homeController.isLoading.value?listForSearch.value = List.from(homeController.listAllFood):listForSearch.value=[];
  }
  searchUpdate(String value){
    listForSearch.value = homeController.listAllFood.where((e) => e.name!.toLowerCase().contains(value.toLowerCase())).toList();
  }
}