//import 'package:flutter_mvvm_framework/di/app_module.dart';
//import 'package:rxdart/rxdart.dart';
//
//Future _get(String url, {Map<String, dynamic> params}) async {
//  var response = await _dio.get(url, queryParameters: params);
//  return response.data;
//}
//
//Observable get(String url, {Map<String, dynamic> params}) =>
//    Observable.fromFuture(_get(url, params: params)).asBroadcastStream();
//
//Future _post(String url, Map<String, dynamic> params) async {
//  var response = await _dio.post(url, data: params);
//  return response.data;
//}
//
//Observable post(String url, Map<String, dynamic> params) =>
//    Observable.fromFuture(_post(url, params)).asBroadcastStream();
