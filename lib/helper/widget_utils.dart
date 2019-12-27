import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_framework/helper/toast.dart';

/// 对错误 [e] 进行分发处理
dispatchFailure(BuildContext context, dynamic e) {
  var message = e.toString();
  if (e is DioError) {
    final response = e.response;

    if (response?.statusCode == 401) {
    } else if (response?.statusCode == 403) {
      message = "account or password error";
    } else if (response?.statusCode == 404) {
      message = "forbidden";
    } else if (response?.statusCode == 500) {
      message = "page not found";
    } else if (response?.statusCode == 503) {
      message = "Server internal error";
    } else if (e.error is SocketException) {
      message = "network cannot use";
    } else {
      message = "Oops!!";
    }
  }
  print("error : $message");
  if (context != null) {
    Toast.show(message, context, type: Toast.ERROR);
  }
}
