//this will have a loading...
//changes made?

import 'package:loginagain/view/utils/delay.dart';
import 'package:loginagain/view/utils/state_enum.dart';
import 'base_state.dart';

class UserState extends BaseState {
  bool changes;

  UserState() {changes = false;}

  //call this when anything in the form is changed
  change(){
    changes = true;
  }

  //use this on the save button to send to server
  save() async {
    setState(ViewState.Busy);
    print('mock saving to the server...');
    await delay(1000);
    changes = false;
    setState(ViewState.Idle);
  }
}
