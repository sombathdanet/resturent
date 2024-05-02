import 'package:restaurant_app/model/food_model/popular_food_model.dart';

class DetailModel {
  int? status;
  String? message;
  String? messageKey;
  DataPopular? data;
  dynamic paging;

  DetailModel(
      {this.status, this.message, this.messageKey, this.data, this.paging});

  DetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    messageKey = json['messageKey'];
    data = json['data'] != null ? new DataPopular.fromJson(json['data']) : null;
    paging = json['paging'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['messageKey'] = this.messageKey;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['paging'] = this.paging;
    return data;
  }
}

class Data {
  String? name;
  int? id;
  String? description;
  bool? status;
  String? code;
  double? price;
  double? discount;
  FoodCategoryEntity? foodCategoryEntity;
  List<FoodImageEntities>? foodImageEntities;
  late int qty;
  Data({
        this.name,
        this.id,
        this.description,
        this.status,
        this.code,
        this.price,
        this.discount,
        this.foodCategoryEntity,
        this.foodImageEntities,
        this.qty=1,
      });

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    description = json['description'];
    status = json['status'];
    code = json['code'];
    price = json['price'];
    discount = json['discount'];
    foodCategoryEntity = json['foodCategoryEntity'] != null
        ? new FoodCategoryEntity.fromJson(json['foodCategoryEntity'])
        : null;
    if (json['foodImageEntities'] != null) {
      foodImageEntities = <FoodImageEntities>[];
      json['foodImageEntities'].forEach((v) {
        foodImageEntities!.add(new FoodImageEntities.fromJson(v));
      });
    }
    qty = 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['description'] = this.description;
    data['status'] = this.status;
    data['code'] = this.code;
    data['price'] = this.price;
    data['discount'] = this.discount;
    if (this.foodCategoryEntity != null) {
      data['foodCategoryEntity'] = this.foodCategoryEntity!.toJson();
    }
    if (this.foodImageEntities != null) {
      data['foodImageEntities'] =
          this.foodImageEntities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FoodCategoryEntity {
  String? name;

  FoodCategoryEntity({this.name});

  FoodCategoryEntity.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class FoodImageEntities {
  int? id;
  String? url;

  FoodImageEntities({this.id, this.url});

  FoodImageEntities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}
