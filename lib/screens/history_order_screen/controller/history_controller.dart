import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/model/booking_model/detail_order.dart';
import 'package:restaurant_app/model/booking_model/order_model.dart';
import 'package:restaurant_app/repository/food_repo.dart';

class HistoryController extends GetxController {
  FoodRepo foodRepo;
  HistoryController({required this.foodRepo});
  List<DataOrder> dataOrder = [];
  @override
  onInit(){
    super.onInit();
    getDataOrder();
  }
  getDataOrder()async{
    try{
      final res = await foodRepo.getOrder();
        dataOrder = res!;
    }on DioException catch(e){
      print(e.response?.statusMessage.toString());
    }
    update();
  }
  deleteOrder(int orderId)async {
    try {
      final res = await foodRepo.deleteOrder(orderId);
      if(res.status == 200){
        dataOrder = (await foodRepo.getOrder())!;
        update();
      }
    } on DioException catch (e) {
      print(e.response?.statusMessage.toString());
    }
  }
  List<DataDetail> orderDetail = [];
  getDetailOrder(int orderId)async{
    try{
      final res = await foodRepo.getDetailOrder(orderId);
      if(res.status == 200){
        orderDetail = res.data!;
      }
    }on DioException catch(e){
      print(e.response!.statusMessage);
    }
    update();
  }
  getTotalQuantity(List<DataDetail> list){
    int totalQuantity = 0;
    for(int i = 0; i<list.length ;i++){
      totalQuantity += list[i].quantity!;
    }
    return totalQuantity;
  }
}