import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:restaurant_app/screens/booking_table_screen/model/time_item_model.dart';

class BookingTableModel {
  // Rx<List<TimeItemModel>> timeItemList =
  //     Rx(List.generate(8, (index) => TimeItemModel()));
  Rx<bool>? isSelected = Rx(false);
  Rx<List<TimeItemModel>> timeItemList = Rx(
    [
      TimeItemModel(
        time: "17:00".obs,
      ),
      TimeItemModel(
        time: "18:00".obs,
      ),
      TimeItemModel(
        time: "19:00".obs,
      ),
      TimeItemModel(
        time: "20:00".obs,
      ),
      TimeItemModel(
        time: "21:00".obs,
      ),
      TimeItemModel(
        time: "22:00".obs,
      ),
      TimeItemModel(
        time: "23:00".obs,
      ),
      TimeItemModel(
        time: "24:00".obs,
      ),
    ],
  );
}
