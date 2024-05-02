import 'package:intl/intl.dart';

class SignUpModel {
  String? name;
  String? username;
  String? gender;
  String? email;
  String? password;
  String? confirmPassword;
  String? phone;
  int? salary;
  String? hireDate;
  int? roleId;

  SignUpModel(
      {this.name,
        this.username,
        this.gender,
        this.email,
        this.password,
        this.confirmPassword,
        this.phone,
        this.salary,
        this.hireDate,
        this.roleId});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    gender = json['gender'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
    phone = json['phone'];
    salary = json['salary'];
    hireDate = json['hire_date'];
    roleId = json['role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['password'] = this.password;
    data['confirm_password'] = this.confirmPassword;
    data['phone'] = this.phone;
    data['salary'] = this.salary;
    data['hire_date'] = this.hireDate;
    data['role_id'] = this.roleId;
    return data;
  }
}
