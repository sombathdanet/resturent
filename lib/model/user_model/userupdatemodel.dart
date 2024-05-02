class UpdateProfileModel {
  String? name;
  String? gender;
  String? phone;
  String? avatar;

  UpdateProfileModel({this.name, this.gender, this.phone, this.avatar});

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    gender = json['gender'];
    phone = json['phone'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['gender'] = gender;
    data['phone'] = phone;
    data['avatar'] = avatar;
    return data;
  }
}