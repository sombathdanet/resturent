import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/model/booking_model/booking_model.dart';
import 'package:restaurant_app/model/table_model/table_model.dart';
import 'package:restaurant_app/repository/table_repo.dart';
import 'package:restaurant_app/routes/app_routes.dart';
import 'package:restaurant_app/screens/booking_table_screen/model/booking_table_model.dart';
import 'package:restaurant_app/screens/user_screen/Widget/show_snackbar.dart';

import '../../../model/booking_model/respone_model_booking.dart';
import '../../../model/food_model/cart_model.dart';
import '../../cart_screen/controller/cart_screen_controller.dart';
import '../../history_order_screen/controller/history_controller.dart';
import '../../user_screen/user_profile_screen/controller/main_profile_controller.dart';

class TableController extends GetxController{
  TableRepo tableRepo;
  TableController({required this.tableRepo});
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDataTable();
  }
  RxList<Data?> tableData = RxList.empty(growable: true);
  RxList<Data?> availableTable = RxList.empty(growable: true);
  late CartScreenController cartScreenController = Get.find();
  late MainProfileController mainProfileController = Get.find();
  final copy =<Data>[].obs;
  getDataTable()async{
    try{
      final res = await tableRepo.getTableData();
      if(res.status == 200){
        tableData(res.data);
        copy.value = List.from(tableData);
      }
    }on DioException catch(e){
      final message = TableModel.fromJson(e.response!.data!);
      showErrorSnackBar(message: message.message!);
    }
  }
   RxList<Data?> get getAvailableTable{
     return RxList<Data?>.from(tableData.where((element) => element?.status == "Available").toList());
  }
  List<Items> cartToItem(List<CartModel?> cartModel){
    List<Items> listItem =[];
    for (var element in cartModel) {
      Items items = Items(foodId: element!.id,quantity: element.qty);
      listItem.add(items);
    }
    return listItem;
  }
  final historyController = Get.find<HistoryController>();
  void bookingTable(int? tableId)async{
    try{
      if(tableId != null){
        final cartList = cartScreenController.getCartList;
        final userId =  mainProfileController.userProfile.value!.data!.id!;
        final item = cartToItem(cartList);
        BookingModel bookingModel = BookingModel(tableId: tableId, userId: userId, items: item,);
        final res = await tableRepo.bookingTable(bookingModel);
        if(res.status == 200){
          Get.offAllNamed(AppRoutes.completeBookingScreen);
          cartScreenController.clearCart();
           historyController.getDataOrder();
          update();
        }
      }
    }on DioException catch(e){
      final list = ResModelBooking.fromJson(e.response!.data!);
      showErrorSnackBar(message: list.messageKey!);
    }
  }
}