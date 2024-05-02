class ChangePassResponse{
  int? status;
  String? message;
  String? messageKey;
  dynamic data;
  dynamic paging;
  ChangePassResponse(this.status,this.message,this.messageKey,this.paging);

  ChangePassResponse.fromJson(Map<String,dynamic> json){
    status = json['status'];
    message = json['message'];
    messageKey = json['messageKey'];
    data = json['data'];
    paging = json['paging'];
  }
}