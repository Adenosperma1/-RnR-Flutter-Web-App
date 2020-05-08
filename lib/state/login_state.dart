import 'package:loginagain/view/utils/delay.dart';
import 'package:loginagain/view/utils/locator.dart';
import 'package:loginagain/view/utils/state_enum.dart';
import 'currentUser_state.dart';
import 'base_state.dart';

class LoginState extends BaseState {
  //extends ChangeNotifier //
  final CurrentUserState _currentUserState = locator<CurrentUserState>();

  String errorMessage;
  //also has setState in BaseState
  //get state returns idle or busy

  Future<bool> login({String email, String password}) async {
    print("Logging in..");
    print("State: " + state.toString());
    setState(ViewState.Busy);
    print("State: " + state.toString());
/*
    if (email != "a" || password != "1") {
      await delay(1000);
      errorMessage = 'Wrong email or password!';
      setState(ViewState.Idle);
      print("State: " + state.toString());
      print("log in failed");
      return false;
    } else {
*/
      var success = await _currentUserState.login(1);

      errorMessage = '';
      // Handle potential error here too.

      setState(ViewState.Idle);
      print("State: " + state.toString());
      print("log in success");
      return success;
    }
  }

  //currentState() {
  //  return state.toString();
  //}
//}
