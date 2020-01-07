class ResponseDataEntity {
  dynamic data;
  String errMsg;
  int errorCode;

  ResponseDataEntity({this.data, this.errMsg, this.errorCode});

  bool success() {
    return errorCode == 0;
  }

  ResponseDataEntity.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    errMsg = json['err_msg'];
    errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['err_msg'] = this.errMsg;
    data['error_code'] = this.errorCode;
    return data;
  }
}
