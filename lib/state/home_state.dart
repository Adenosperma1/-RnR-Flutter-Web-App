import 'package:loginagain/view/utils/delay.dart';
import 'package:loginagain/view/utils/state_enum.dart';
import 'base_state.dart';

class HomeState extends BaseState {
  String _section = "";
  ViewState _sectionState = ViewState.Idle;

  ViewState get state => _sectionState;

  section() {
    return _section;
  }

  sectionState() {
    return _sectionState;
  }

  void setSectionState(ViewState viewState) {
    _sectionState = viewState;
    notifyListeners();
  }

  changeSection({String sectionName}) async {
    //TODO need to pop the menu on a small screen

    setSectionState(ViewState.Busy);
    _section = sectionName; //this allows the button to update
    await delay(1000); //this simulates the section delay
    setSectionState(ViewState.Idle);
  }
}
