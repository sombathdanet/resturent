class CurrentModel {
  int? status;
  String? message;
  String? messageKey;
  Data? data;
  dynamic paging;

  CurrentModel(
      {this.status, this.message, this.messageKey, this.data, this.paging});

  CurrentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    messageKey = json['messageKey'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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
  String? location;
  int? id;
  String? googleMapUrl;
  CreatedBy? createdBy;
  String? createdDate;
  String? updateDate;

  Data(
      {this.name,
        this.location,
        this.id,
        this.googleMapUrl,
        this.createdBy,
        this.createdDate,
        this.updateDate});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'];
    id = json['id'];
    googleMapUrl = json['googleMapUrl'];
    createdBy = json['createdBy'] != null
        ? new CreatedBy.fromJson(json['createdBy'])
        : null;
    createdDate = json['createdDate'];
    updateDate = json['updateDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['location'] = this.location;
    data['id'] = this.id;
    data['googleMapUrl'] = this.googleMapUrl;
    if (this.createdBy != null) {
      data['createdBy'] = this.createdBy!.toJson();
    }
    data['createdDate'] = this.createdDate;
    data['updateDate'] = this.updateDate;
    return data;
  }
}

class CreatedBy {
  String? name;
  int? id;

  CreatedBy({this.name, this.id});

  CreatedBy.fromJson(Map<String, dynamic> json) {
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
