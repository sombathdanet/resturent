import 'dart:convert';
import 'package:restaurant_app/constants/app_constant.dart';
import 'package:restaurant_app/model/food_model/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo{
  Future<SharedPreferences>  getSp() async => await SharedPreferences.getInstance();


  Future<List<CartModel>?> getList() async{
    final sp = await getSp();
    final list = sp.getStringList(ServerRout.cartKey);
    return list?.map((e) => CartModel.fromJson(jsonDecode(e))).toList()??[];
  }

  Future<bool> putCarts(List<CartModel?> listCartModel)async{
    final sp = await getSp();
    List<String> cartListString = listCartModel.map((e) => jsonEncode(e!.toJson())).toList();
    return  await sp.setStringList(ServerRout.cartKey, cartListString);
  }

  void clearCart()async{
    final sp = await getSp();
    sp.remove(ServerRout.cartKey);
  }
}