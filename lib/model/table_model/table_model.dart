class TableModel {
  int? status;
  String? message;
  String? messageKey;
  List<Data>? data;
  Paging? paging;

  TableModel(
      {this.status, this.message, this.messageKey, this.data, this.paging});

  TableModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    messageKey = json['messageKey'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? name;
  int? id;
  String? status;
  String? seatCapacity;

  Data({this.name, this.id, this.status, this.seatCapacity});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    status = json['status'];
    seatCapacity = json['seat_Capacity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['status'] = this.status;
    data['seat_Capacity'] = this.seatCapacity;
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
