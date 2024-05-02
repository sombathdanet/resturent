import 'package:restaurant_app/client/getx_client.dart';
import 'package:restaurant_app/constants/app_constant.dart';
import 'package:restaurant_app/model/booking_model/booking_model.dart';
import 'package:restaurant_app/model/booking_model/respone_model_booking.dart';
import 'package:restaurant_app/model/table_model/table_model.dart';

class TableRepo{
  Future<TableModel> getTableData()async{
    final res = await GetXClient.instance.get(path:ServerRout.tablePath );
    return TableModel.fromJson(res);
  }
  Future<ResModelBooking> bookingTable(BookingModel bookingModel)async{
    final res = await GetXClient.instance.post(path:ServerRout.bookingPath,data: bookingModel.toJson());
    return ResModelBooking.fromJson(res);
  }
}