import 'package:get/get_rx/src/rx_types/rx_types.dart';

class TimeItemModel {
  TimeItemModel({
    this.time,
    this.id,
  }) {
    time = time ?? Rx("17:00");
    id = id ?? Rx("");
  }

  Rx<String>? time;
  Rx<String>? id;

  Rx<bool>? isSelected = Rx(false);
}
