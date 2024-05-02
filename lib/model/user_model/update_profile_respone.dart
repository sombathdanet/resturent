class UpdateResponse {
  int? status;
  String? message;
  String? messageKey;
  String? data;
  dynamic paging;

  UpdateResponse(
      {this.status, this.message, this.messageKey, this.data, this.paging});

  UpdateResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    messageKey = json['messageKey'];
    data = json['data'];
    paging = json['paging'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['messageKey'] = this.messageKey;
    data['data'] = this.data;
    data['paging'] = this.paging;
    return data;
  }
}