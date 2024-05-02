class DetailOrder {
  int? status;
  String? message;
  String? messageKey;
  List<DataDetail>? data;
  dynamic paging;

  DetailOrder(
      {this.status, this.message, this.messageKey, this.data, this.paging});

  DetailOrder.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    messageKey = json['messageKey'];
    if (json['data'] != null) {
      data = <DataDetail>[];
      json['data'].forEach((v) {
        data!.add(new DataDetail.fromJson(v));
      });
    }
    paging = json['paging'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['messageKey'] = this.messageKey;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['paging'] = this.paging;
    return data;
  }
}

class DataDetail {
  int? id;
  int? quantity;
  Food? food;
  double? totalPrice;
  Order? order;

  DataDetail({this.id, this.quantity, this.food, this.totalPrice, this.order});

  DataDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    food = json['food'] != null ? new Food.fromJson(json['food']) : null;
    totalPrice = json['total_Price'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    if (this.food != null) {
      data['food'] = this.food!.toJson();
    }
    data['total_Price'] = this.totalPrice;
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class Food {
  String? name;
  String? code;
  double? price;
  List<FoodImage>? foodImage;

  Food({this.name, this.code, this.price, this.foodImage});

  Food.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    price = json['price'];
    if (json['food_image'] != null) {
      foodImage = <FoodImage>[];
      json['food_image'].forEach((v) {
        foodImage!.add(new FoodImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['price'] = this.price;
    if (this.foodImage != null) {
      data['food_image'] = this.foodImage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FoodImage {
  int? id;
  String? url;

  FoodImage({this.id, this.url});

  FoodImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}

class Order {
  int? id;
  String? status;
  String? paymentMethod;

  Order({this.id, this.status, this.paymentMethod});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    paymentMethod = json['paymentMethod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['paymentMethod'] = this.paymentMethod;
    return data;
  }
}
