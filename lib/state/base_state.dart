import 'package:flutter/widgets.dart';
import 'package:loginagain/view/utils/state_enum.dart';


class BaseState extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
