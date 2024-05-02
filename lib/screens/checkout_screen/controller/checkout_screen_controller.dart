
import 'package:get/get.dart';
import 'package:restaurant_app/screens/history_order_screen/controller/history_controller.dart';
import '../../display_table_screeen/controller/table_controller.dart';

class CheckOutController extends GetxController{
  final controller = Get.find<TableController>();
  void payNow(int tableID){
    controller.bookingTable(tableID);
  }
}