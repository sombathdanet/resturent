// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'dart:convert';

LocationModel locationModelFromJson(String str) => LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
  int status;
  String message;
  String messageKey;
  List<Datum> data;
  Paging paging;

  LocationModel({
    required this.status,
    required this.message,
    required this.messageKey,
    required this.data,
    required this.paging,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    status: json["status"],
    message: json["message"],
    messageKey: json["messageKey"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    paging: Paging.fromJson(json["paging"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "messageKey": messageKey,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "paging": paging.toJson(),
  };
}

class Datum {
  String name;
  String location;
  int id;
  String googleMapUrl;
  CreatedBy createdBy;
  DateTime createdDate;
  DateTime updateDate;

  Datum({
    required this.name,
    required this.location,
    required this.id,
    required this.googleMapUrl,
    required this.createdBy,
    required this.createdDate,
    required this.updateDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    location: json["location"],
    id: json["id"],
    googleMapUrl: json["googleMapUrl"],
    createdBy: CreatedBy.fromJson(json["createdBy"]),
    createdDate: DateTime.parse(json["createdDate"]),
    updateDate: DateTime.parse(json["updateDate"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "location": locationValues.reverse[location],
    "id": id,
    "googleMapUrl": googleMapUrl,
    "createdBy": createdBy.toJson(),
    "createdDate": createdDate.toIso8601String(),
    "updateDate": updateDate.toIso8601String(),
  };
}

class CreatedBy {
  Name name;
  int id;

  CreatedBy({
    required this.name,
    required this.id,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    name: nameValues.map[json["name"]]!,
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "id": id,
  };
}

enum Name {
  MONKEY_D_LUFFY
}

final nameValues = EnumValues({
  "Monkey D Luffy": Name.MONKEY_D_LUFFY
});

enum Location {
  PP,
  PV
}

final locationValues = EnumValues({
  "PP": Location.PP,
  "pv": Location.PV
});

class Paging {
  int page;
  int size;
  int totalPage;
  int totals;

  Paging({
    required this.page,
    required this.size,
    required this.totalPage,
    required this.totals,
  });

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
    page: json["page"],
    size: json["size"],
    totalPage: json["totalPage"],
    totals: json["totals"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "size": size,
    "totalPage": totalPage,
    "totals": totals,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
