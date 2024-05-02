class BookingModel {
  int? tableId;
  int? userId;
  List<Items>? items;

  BookingModel({this.tableId, this.userId, this.items});

  BookingModel.fromJson(Map<String, dynamic> json) {
    tableId = json['table_Id'];
    userId = json['user_Id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['table_Id'] = this.tableId;
    data['user_Id'] = this.userId;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? foodId;
  int? quantity;

  Items({this.foodId, this.quantity});

  Items.fromJson(Map<String, dynamic> json) {
    foodId = json['food_Id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['food_Id'] = this.foodId;
    data['quantity'] = this.quantity;
    return data;
  }
}
