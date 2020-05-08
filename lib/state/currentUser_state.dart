import 'dart:async';
import 'package:loginagain/view/utils/locator.dart';

import 'package:loginagain/model/user/user_model.dart';
import 'package:loginagain/model/user/user_api.dart';

class CurrentUserState {
  UserApi _userApi = locator<UserApi>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    var fetchedUser = await _userApi.getUserProfile(userId);
    var hasUser = fetchedUser != null;
    if (fetchedUser != null) {
      userController.add(fetchedUser);
    }
    return hasUser;
  }

logout() async {
userController.add(null);
}


}
