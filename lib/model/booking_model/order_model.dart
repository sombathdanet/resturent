class OrderModel {
  int? status;
  String? message;
  String? messageKey;
  List<DataOrder>? data;
  Paging? paging;

  OrderModel(
      {this.status, this.message, this.messageKey, this.data, this.paging});

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    messageKey = json['messageKey'];
    if (json['data'] != null) {
      data = <DataOrder>[];
      json['data'].forEach((v) {
        data!.add(new DataOrder.fromJson(v));
      });
    }
    paging =
    json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['messageKey'] = this.messageKey;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
    return data;
  }
}

class DataOrder {
  int? id;
  User? user;
  double? totalPrice;
  User? table;

  DataOrder({this.id, this.user, this.totalPrice, this.table});

  DataOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    totalPrice = json['total_Price'];
    table = json['table'] != null ? new User.fromJson(json['table']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['total_Price'] = this.totalPrice;
    if (this.table != null) {
      data['table'] = this.table!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  int? id;

  User({this.name, this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
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
