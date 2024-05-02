class UserProfileModel {
  int? status;
  String? message;
  String? messageKey;
  Data? data;
  dynamic paging;

  UserProfileModel(
      {this.status, this.message, this.messageKey, this.data, this.paging});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    messageKey = json['messageKey'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    paging = json['paging'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['messageKey'] = messageKey;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['paging'] = paging;
    return data;
  }
}

class Data {
  String? name;
  int? id;
  bool? status;
  String? username;
  String? gender;
  double? salary;
  String? email;
  String? phone;
  String? avatar;
  String? hireDate;
  RoleEntity? roleEntity;
  RoleEntity? createdBy;
  RoleEntity? updateBy;
  String? createdDate;
  String? updateDate;

  Data(
      {this.name,
        this.id,
        this.status,
        this.username,
        this.gender,
        this.salary,
        this.email,
        this.phone,
        this.avatar,
        this.hireDate,
        this.roleEntity,
        this.createdBy,
        this.updateBy,
        this.createdDate,
        this.updateDate});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    status = json['status'];
    username = json['username'];
    gender = json['gender'];
    salary = json['salary'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    hireDate = json['hireDate'];
    roleEntity = json['roleEntity'] != null
        ? RoleEntity.fromJson(json['roleEntity'])
        : null;
    createdBy = json['createdBy'] != null
        ? RoleEntity.fromJson(json['createdBy'])
        : null;
    updateBy = json['updateBy'] != null
        ? RoleEntity.fromJson(json['updateBy'])
        : null;
    createdDate = json['createdDate'];
    updateDate = json['updateDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['status'] = status;
    data['username'] = username;
    data['gender'] = gender;
    data['salary'] = salary;
    data['email'] = email;
    data['phone'] = phone;
    data['avatar'] = avatar;
    data['hireDate'] = hireDate;
    if (roleEntity != null) {
      data['roleEntity'] = roleEntity!.toJson();
    }
    if (createdBy != null) {
      data['createdBy'] = createdBy!.toJson();
    }
    if (updateBy != null) {
      data['updateBy'] = updateBy!.toJson();
    }
    data['createdDate'] = createdDate;
    data['updateDate'] = updateDate;
    return data;
  }
}

class RoleEntity {
  String? name;
  int? id;

  RoleEntity({this.name, this.id});

  RoleEntity.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}