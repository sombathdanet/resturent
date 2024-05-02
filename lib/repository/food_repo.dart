import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/client/getx_client.dart';
import 'package:restaurant_app/constants/app_constant.dart';
import 'package:restaurant_app/model/auth_model/response_model.dart';
import 'package:restaurant_app/model/booking_model/order_model.dart';
import 'package:restaurant_app/model/food_model/detail_food_model.dart';
import 'package:restaurant_app/model/food_model/food_category_model.dart';
import 'package:restaurant_app/model/food_model/popular_food_model.dart';
import 'package:restaurant_app/screens/user_screen/Widget/show_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/booking_model/detail_order.dart';
import '../model/booking_model/respone_model_booking.dart';

class FoodRepo{
  Future<SharedPreferences>  _sp() =>  SharedPreferences.getInstance();

  Future<FoodPopularModel> getFoodByFilter(String query)async{
    final res = await GetXClient.instance.get(path: ServerRout.popularFoodPath,queryParameters: {'filters':query});
    final list = FoodPopularModel.fromJson(res);
    return list;
  }
  Future<List<DataCategory>?> getDataFromCategory()async{
    final res = await GetXClient.instance.get(path: ServerRout.categoryPath);
    final list = FoodCategoryModel.fromJson(res).data;
    return list;
  }
  Future<List<DataPopular>?> getAllFoodData()async{
    final res = await GetXClient.instance.get(path: ServerRout.allFoodPath);
    final list = FoodPopularModel.fromJson(res).data;
    return list;
  }
  Future<DetailModel> getDetailScreen(int id)async {
    final res = await GetXClient.instance.get(
        path: "${ServerRout.allFoodPath}/$id");
    final map = DetailModel.fromJson(res);
    return map;
  }

  Future<bool> putFav(List<DataPopular> favorite)async{
    final list = await getFavList();
    for (var element in favorite) {
      list?.add(element);
    }
    return putFavList(list!);
  }

  Future<bool> putFavList(List<DataPopular> favoriteList)async{
    final pref = await _sp();
    List<String> list = favoriteList.map((e) => jsonEncode(e.toJson())).toList();
    return pref.setStringList(ServerRout.fav_Key, list);
  }

  Future<List<DataPopular>?> getFavList() async{
    final pref = await _sp();
    final list = pref.getStringList(ServerRout.fav_Key);
    return list?.map((e) => DataPopular.fromJson(jsonDecode(e))).toList() ?? [];
  }

  Future<bool> removeById(DataPopular favList)async{
    final list = await getFavList();
    final index = list?.indexWhere((element) => element.id == favList.id);
    if(index != - 1){
      list?.removeAt(index!);
       putFavList(list!);
    }
    return false;
  }
  Future<bool> checkHasFav(DataPopular favorite)async{
    final list  = await getFavList();
    final isHas = list?.indexWhere((element) => element.id == favorite.id) != -1;
    return isHas;
  }

  Future<List<DataOrder>?> getOrder()async{
    final res = await GetXClient.instance.get(path: ServerRout.orderPath);
    return OrderModel.fromJson(res).data;
  }
  Future<ResModelBooking> deleteOrder(int orderID)async{
    final res = await GetXClient.instance.delete(path: "${ServerRout.orderPath}/$orderID");
    return ResModelBooking.fromJson(res);
  }
  Future<DetailOrder> getDetailOrder(int orderId) async{
    final res = await GetXClient.instance.get(path: "${ServerRout.orderPath}/$orderId");
    return DetailOrder.fromJson(res);
  }
}