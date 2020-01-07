import 'package:flutter_mvvm_framework/viewmodel/locale_model.dart';
import 'package:flutter_mvvm_framework/viewmodel/theme_model.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

/// 独立的model
List<SingleChildCloneableWidget> independentServices = [
  ChangeNotifierProvider<ThemeModel>(
    create: (context) => ThemeModel(),
  ),
  ChangeNotifierProvider<LocaleModel>(
    create: (context) => LocaleModel(),
  ),
//  ChangeNotifierProvider<GlobalFavouriteStateModel>(
//    builder: (context) => GlobalFavouriteStateModel(),
//  )
];

/// 需要依赖的model
///
/// UserModel依赖globalFavouriteStateModel
List<SingleChildCloneableWidget> dependentServices = [
//  ChangeNotifierProxyProvider<GlobalFavouriteStateModel, UserModel>(
//    builder: (context, globalFavouriteStateModel, userModel) =>
//        userModel ??
//        UserModel(globalFavouriteStateModel: globalFavouriteStateModel),
//  )
];

List<SingleChildCloneableWidget> uiConsumableProviders = [
//  StreamProvider<User>(
//    builder: (context) => Provider.of<AuthenticationService>(context, listen: false).user,
//  )
];
