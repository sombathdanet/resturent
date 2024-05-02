class ChangePassModel {
  String? oldPassword;
  String? password;
  String? confirmPassword;

  ChangePassModel({this.oldPassword, this.password, this.confirmPassword});

  ChangePassModel.fromJson(Map<String, dynamic> json) {
    oldPassword = json['old_Password'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['old_password'] = this.oldPassword;
    data['password'] = this.password;
    data['confirm_password'] = this.confirmPassword;
    return data;
  }
}