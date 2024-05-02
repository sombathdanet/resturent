class FoodCategoryModel {
  int? status;
  String? message;
  String? messageKey;
  List<DataCategory>? data;
  Paging? paging;

  FoodCategoryModel(
      {this.status, this.message, this.messageKey, this.data, this.paging});

  FoodCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    messageKey = json['messageKey'];
    if (json['data'] != null) {
      data = <DataCategory>[];
      json['data'].forEach((v) {
        data!.add(new DataCategory.fromJson(v));
      });
    }
    paging =
    json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
  }
}

class DataCategory {
  String? name;
  int? id;
  CreatedBy? createdBy;
  String? createdDate;
  String? updateDate;
  List<FoodEntities>? foodEntities;

  DataCategory(
      {this.name,
        this.id,
        this.createdBy,
        this.createdDate,
        this.updateDate,
        this.foodEntities});

  DataCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    createdBy = json['createdBy'] != null
        ? new CreatedBy.fromJson(json['createdBy'])
        : null;
    createdDate = json['createdDate'];
    updateDate = json['updateDate'];
    if (json['foodEntities'] != null) {
      foodEntities = <FoodEntities>[];
      json['foodEntities'].forEach((v) {
        foodEntities!.add(new FoodEntities.fromJson(v));
      });
    }
  }
}

class CreatedBy {
  String? name;
  String? email;
  String? phone;

  CreatedBy({this.name, this.email, this.phone});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
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

class Paging {
  int? page;
  int? size;
  int? totalPage;
  int? totals;

  Paging({this.page, this.size, this.totalPage, this.totals});

  Paging.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    size = json['size'];
    totalPage = json['totalPage'];
    totals = json['totals'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['size'] = this.size;
    data['totalPage'] = this.totalPage;
    data['totals'] = this.totals;
    return data;
  }
}
