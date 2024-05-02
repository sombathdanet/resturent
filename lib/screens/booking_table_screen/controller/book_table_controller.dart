import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/booking_table_model.dart';

class BookTableController extends GetxController {
  Rx<BookingTableModel> bookTableModelObj = BookingTableModel().obs;
  Rx<DateTime> selectedDatesFromCalendar1 = DateTime.now().obs;
  RxInt guests = 0.obs;

  void incrementNumber() {
    guests.value++;
  }

  void decrementNumber() {
    guests.value--;
  }

  Rx<bool>? isSelected = Rx(false);
}
