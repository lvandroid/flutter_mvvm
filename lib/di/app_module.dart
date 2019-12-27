import 'package:dartin/dartin.dart';
import 'package:dio/dio.dart';
import 'package:flutter_mvvm_framework/helper/constants.dart';
import 'package:flutter_mvvm_framework/helper/shared_preferences.dart';
import 'package:flutter_mvvm_framework/model/repository.dart';
import 'package:flutter_mvvm_framework/viewmodel/home_provide.dart';

const testScope = DartInScope('test');

/// ViewModel 模块
///
/// 定义ViewModel的构造方式
final viewModelModule = Module([
  factory<HomeProvide>(({params}) => HomeProvide(get(), params.get(0))),
])
  ..addOthers(testScope, []);

/// Repository 模块
///
/// 定义Repository 的构造方式
final repoModule = Module([
  lazy<GithubRepo>(({params}) => GithubRepo(get(), get())),
]);

/// Remote 模块
///
/// 定义各网络接口服务的构造方式
final remoteModule = Module([
  single<GithubService>(GithubService()),
]);

/// Local 模块
///
/// 定义数据库层及SharedPreference/KV等等本地存储的构造方式
final localModule = Module([
  single<SpUtil>(spUtil),
]);

final appModule = [
  viewModelModule,
  repoModule,
  remoteModule,
  localModule,
];

/// AuthInterceptor
///
/// 添加header认证
class AuthInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) {
    final token = spUtil.getString(KEY_TOKEN);
    options.headers
        .update("Authorization", (_) => token, ifAbsent: () => token);
    return super.onRequest(options);
  }
}

final dio = Dio()
  ..options = BaseOptions(
      baseUrl: 'https://api.github.com/',
      connectTimeout: 30,
      receiveTimeout: 30)
  ..interceptors.add(AuthInterceptor())
  ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

SpUtil spUtil;

/// init
///
/// 初始化 [spUtil] 并启动[DartIn]
init() async {
  spUtil = await SpUtil.getInstance();
  startDartIn(appModule);
}
