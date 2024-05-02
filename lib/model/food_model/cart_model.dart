import 'detail_food_model.dart';

class CartModel{
  int? id;
  String? name;
  String? imgUrl;
  int qty;
  double? totalAmount;
  DetailModel detailModel;
  CartModel({required this.id,required this.name,required this.imgUrl,required this.qty,required this.totalAmount,required this.detailModel});
  Map<String,dynamic> toJson()=>{
    "id":id,
    "name":name,
    "imageUrl":imgUrl,
    "qty":qty,
    "totalAmount":totalAmount,
    "detailModel":detailModel.toJson(),
  };
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      name: json['name'],
      imgUrl: json['imageUrl'],
      qty: json['qty'],
      totalAmount: json['totalAmount'],
      detailModel: DetailModel.fromJson(json['detailModel']),
    );
  }
}