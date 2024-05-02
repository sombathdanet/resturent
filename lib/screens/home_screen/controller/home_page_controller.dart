import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/model/food_model/food_category_model.dart';
import 'package:restaurant_app/model/location_model/location_model.dart';
import 'package:restaurant_app/screens/menu-screen/controller/menu_controller.dart';
import 'package:restaurant_app/screens/user_screen/Widget/show_snackbar.dart';

import '../../../model/food_model/popular_food_model.dart';
import '../../../model/location_model/curren_model.dart';
import '../../../repository/food_repo.dart';
import '../../../repository/location_repo.dart';
import '../model/home_page_model.dart';
import '../model/product_item_model.dart';
import '../../../routes/app_routes.dart';

class HomeController extends GetxController {
  final FoodRepo foodRepo;
  final LocationRepo locationRepo;
  HomeController(this.homeModelObj,this.foodRepo, this.locationRepo);

  TextEditingController searchController = TextEditingController();

  Rx<HomePageModel> homeModelObj;
  RxList<DataPopular?> listPopularFood = RxList.empty(growable: true);
  RxList<DataCategory> listCategoryFood = RxList.empty(growable: true);
  RxList<DataCategory> listCopyCategoryFood =RxList.empty(growable: true);
  RxList<DataPopular> listAllFood = RxList.empty(growable: true);


  Rx<bool> isLoading = false.obs;
  Rx<bool> isLoadings = false.obs;
  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPopularFood();
    getAllFood();
    getCategory();
    getLocation();
    getLocationById();
  }
  @override
  void onReady(){
    listCopyCategoryFood(listCategoryFood);
    super.onReady();
  }
  routeToSpecialProductDetail(ProductItemModel specialProductItemModel,int id,DataPopular dataPopular) {
    Get.toNamed(AppRoutes.detailScreen, arguments:
      {'item': specialProductItemModel,"id":id,"list":dataPopular},
    );
  }

  routeToDeliciousProductDetail(ProductItemModel deliciousProductItemModel) {
    Get.toNamed(AppRoutes.detailScreen,
        arguments: {'item': deliciousProductItemModel});
  }

  routeToCategoryScreen() {
    Get.toNamed(AppRoutes.categoryScreen);
  }
  void getPopularFood()async{
    try{
      final res = await foodRepo.getFoodByFilter("popular");
      if(res.status == 200){
        listPopularFood(res.data);
        isLoading(true);
      }
    } on DioException catch(e){
      showErrorSnackBar(message: e.response!.statusMessage.toString());
    }
  }
  void getCategory()async{
    try{
      final res = await foodRepo.getDataFromCategory();
      listCategoryFood(res);
      isLoadings(true);
    }on DioException catch(e){
      showErrorSnackBar(message: e.message!);
    }
  }
  getAllFood()async{
    try{
      final res = await foodRepo.getAllFoodData();
      listAllFood(res);
      isLoadings(true);
    }on DioException catch(e){
      print(e.message!);
    }
  }
  final locationList = <Datum>[].obs;
  getLocation()async{
    try {
      final res = await locationRepo.getLocation();
      if(res.status == 200){
        locationList(res.data);
      }
    } on DioException catch(e){
      debugPrint(e.message);
    }
  }
  final current = Rx<Data?>(null);

  getLocationById()async{
    try{
      final res = await locationRepo.getCurrentLocationById();
      current(res.data);
    }on DioException catch(e){
      print(e.toString());
    }
  }
}
