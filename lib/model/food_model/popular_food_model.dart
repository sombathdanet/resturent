class FoodPopularModel {
  int? status;
  String? message;
  String? messageKey;
  List<DataPopular>? data;
  dynamic paging;

  FoodPopularModel(
      {this.status, this.message, this.messageKey, this.data, this.paging});

  FoodPopularModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    messageKey = json['messageKey'];
    if (json['data'] != null) {
      data = <DataPopular>[];
      json['data'].forEach((v) {
        data!.add(new DataPopular.fromJson(v));
      });
    }
    paging = json['paging'];
  }

  get length => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['messageKey'] = this.messageKey;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['paging'] = this.paging;
    return data;
  }
}

class DataPopular {
  String? name;
  int? id;
  String? description;
  bool? status;
  String? code;
  double? price;
  double? discount;
  String? foodImage;
  FoodCategoryEntity? foodCategoryEntity;
   late int qty;

  DataPopular(
      {this.name,
        this.id,
        this.description,
        this.status,
        this.code,
        this.price,
        this.discount,
        this.foodCategoryEntity,
        this.foodImage,
        this.qty = 1,
      });

  DataPopular.fromJson(Map<String, dynamic> json) {
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
   foodImage = json['foodImage'];
    qty=1;
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
    data['foodImage'] = this.foodImage;
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
class FoodEntities {
  String? name;
  bool? status;
  String? code;
  double? price;

  FoodEntities({this.name, this.status, this.code, this.price});

  FoodEntities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    status = json['status'];
    code = json['code'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['status'] = this.status;
    data['code'] = this.code;
    data['price'] = this.price;
    return data;
  }
}