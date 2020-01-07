import 'dart:async';

import 'package:dartin/dartin.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

/// normal click event
abstract class OnClickListener {
  /// 处理点击事件
  ///
  /// 可根据 [action] 进行区分 ,[action] 应是不可变的量
  void onClick(String action);
}

/// ListView Item Click
abstract class ItemOnClickListener<T> {
  /// 处理列表点击事件
  ///
  /// 可根据 [action] 进行区分 ,[action] 应是不可变的量
  void onItemClick(String action, T item);
}

class BaseViewModel<T, N> with ChangeNotifier {
  CompositeSubscription compositeSubscription = CompositeSubscription();
  final T dataManager;
  N _navigator;

  N get navigator => _navigator;


  set navigator(N value) {
    _navigator = value;
  }

  BaseViewModel() : dataManager = inject<T>();

  /// add [StreamSubscription] to [compositeSubscription]
  ///
  /// 在 [dispose]的时候能进行取消
  addSubscription(StreamSubscription subscription) {
    compositeSubscription.add(subscription);
  }

  @override
  void dispose() {
    if (!compositeSubscription.isDisposed) {
      compositeSubscription.dispose();
    }
    super.dispose();
  }
}

/// page的基类 [BasePage]
///
/// 隐藏了 [Provider] 的调用
abstract class BasePage<T extends ChangeNotifier> extends StatelessWidget
    implements OnClickListener {
  final T mViewModel;

  /// 构造函数
  ///
  /// [params] 代表注入ViewModel[mViewModel]时所需的参数，需按照[mViewModel]的构造方法顺序赋值
  BasePage({List<dynamic> params}) : mViewModel = inject<T>(params: params);

  Widget buildContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: mViewModel,
      child: buildContent(context),
    );
  }

  ///点击事件处理
  ///
  /// 可通过[action]进行分发
  @override
  void onClick(String action) {}
}
