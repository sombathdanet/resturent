import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/client/getx_client.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/model/food_model/detail_food_model.dart';
import 'package:restaurant_app/repository/food_repo.dart';
import 'package:restaurant_app/screens/cart_screen/controller/cart_screen_controller.dart';
import 'package:restaurant_app/screens/user_screen/Widget/show_snackbar.dart';

import '../../model/food_model/cart_model.dart';
import '../../repository/cart_repo.dart';


class DetailScreenController extends GetxController {
  final RxBool isChecked = false.obs;
  final RxBool isExpanded = false.obs;
  FoodRepo foodRepo;
  CartRepo cartRepo;
  DetailScreenController({required this.foodRepo,required this.cartRepo});
  final detailFood = Rx<DetailModel?>(null);
  Rx<bool> isLoading = false.obs;
  final id = Get.arguments['id'];
  final _quantity = 1.obs;
  Rx<int> get quantity => _quantity;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDetailScreen(id);
  }
  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }
  void toggleCheckbox(bool value) {
    isChecked.value = value;
  }
  getDetailScreen(int id)async {
    try{
      final res = await foodRepo.getDetailScreen(id);
      if(res.status == 200){
        detailFood(res);
        isLoading(true);
      }
    }on DioException catch(e){
      showErrorSnackBar(message: e.response!.statusMessage!);
    }
  }
  void increase(int id){
    if(detailFood.value!.data!.id == id){
      _quantity.value ++;
      detailFood.value!.data!.qty = _quantity.value;
    }
  }
  void decrease(int id){
      if(_quantity.value>0){
        _quantity.value --;
      }else{
        _quantity.value = 0;
        detailFood.value!.data!.qty  = _quantity.value;
         showErrorSnackBar(message: "You can reduce item quantity is 0");
      }
  }
}
