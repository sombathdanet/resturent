
import 'package:restaurant_app/client/getx_client.dart';
import 'package:restaurant_app/model/location_model/post_location_model.dart';
import '../../../constants/app_constant.dart';
import '../model/booking_model/respone_model_booking.dart';
import '../model/location_model/curren_model.dart';
import '../model/location_model/location_model.dart';

class LocationRepo {
  Future<LocationModel> getLocation() async {
    final res = await GetXClient.instance.get(path: ServerRout.locationPath);
    return LocationModel.fromJson(res);
  }
  Future<ResModelBooking> addAddress(PostLocationModel locationModel,int? userId)async{
    final res = await GetXClient.instance.post(path: "${ServerRout.locationPath}/$userId",data: locationModel.toJson());
    return ResModelBooking.fromJson(res);
  }
  Future<CurrentModel> getCurrentLocationById()async{
    final res = await GetXClient.instance.get(path: ServerRout.locationPathC);
    return CurrentModel.fromJson(res);
  }
}
