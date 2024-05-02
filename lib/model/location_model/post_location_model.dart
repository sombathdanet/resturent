class PostLocationModel {
  String? name;
  String? location;
  String? googleMapUrl;

  PostLocationModel({this.name, this.location, this.googleMapUrl});

  PostLocationModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'];
    googleMapUrl = json['googleMapUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['location'] = this.location;
    data['googleMapUrl'] = this.googleMapUrl;
    return data;
  }
}
