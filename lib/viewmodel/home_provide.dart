//import 'package:dio/dio.dart';
//import 'package:flutter_mvvm_framework/model/repository.dart';
//import 'package:flutter_mvvm_framework/view/base.dart';
//import 'package:rxdart/rxdart.dart';
//
///// ViewModel 层
/////
///// 将 Model层 [GithubRepo] 返回的数据转换成 View 层 [HomePage] 需要展示的数据
///// 通过 [notifyListeners] 通知UI层更新
//class HomeProvide extends BaseViewModel {
//  final GithubRepo _repo;
//  String username = "";
//  String password = "";
//  bool _loading = false;
//
//  ///结果
//  String _response = "";
//  final String title;
//
//  String get response => _response;
//
//  set response(String value) {
//    _response = value;
//    notifyListeners();
//  }
//
//  bool get loading => _loading;
//
//  double _btnWidth = 295.0;
//
//  double get btnWidth => _btnWidth;
//
//  set btnWidth(double value) {
//    _btnWidth = value;
//    notifyListeners();
//  }
//
//  set loading(bool value) {
//    _loading = value;
//    notifyListeners();
//  }
//
//  HomeProvide(this._repo, this.title);
//
//  /// 登录
//  ///
//  /// 调用 model层[GithubRepo] 的 login 方法进行登录
//  /// 传入 [username] 和 [password]
//  /// 成功：显示返回的信息
//  /// 失败: 处理错误，显示错误信息
//  /// 订阅开始：loading = true
//  /// 订阅结束：loading = false
//  /// 返回 [Observable] 给 View 层
//  Observable login() => _repo
//      .login(username, password)
//      .doOnData((r) => response = r.toString())
//      .doOnError((e, stacktrace) {
//        if (e is DioError) {
//          response = e.response.data.toString();
//        }
//      })
//      .doOnListen(() => loading = true)
//      .doOnDone(() => loading = false);
//}
