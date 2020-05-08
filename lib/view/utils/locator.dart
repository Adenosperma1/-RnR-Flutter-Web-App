import 'package:get_it/get_it.dart';

import 'package:loginagain/model/user/user_api.dart';
import 'package:loginagain/state/currentUser_state.dart';
import 'package:loginagain/state/login_state.dart';
import 'package:loginagain/state/home_state.dart';





GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => UserApi());
  locator.registerLazySingleton(() => CurrentUserState());
  locator.registerFactory(() => LoginState());
  locator.registerFactory(() => HomeState());
}
