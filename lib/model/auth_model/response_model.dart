class LoginResponse {
  int? status;
  String? message;
  String? messageKey;
  Data? data;
  dynamic paging;

  LoginResponse(
      {this.status, this.message, this.messageKey, this.data, this.paging});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    messageKey = json['messageKey'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    paging = json['paging'];
  }

}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
}

class User {
  int? id;
  String? username;
  String? name;
  String? email;
  dynamic avatar;
  String? phone;
  String? roleName;
  int? roleId;
  bool? status;

  User(
      {this.id,
        this.username,
        this.name,
        this.email,
        this.avatar,
        this.phone,
        this.roleName,
        this.roleId,
        this.status});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    phone = json['phone'];
    roleName = json['roleName'];
    roleId = json['roleId'];
    status = json['status'];
  }
}