

import 'package:flutter/widgets.dart';

class AppState extends ChangeNotifier {
  MenuState _currentState = MenuState.JOURNEYS;

  MenuState get state => _currentState;

  changeState(MenuState state) {
    this._currentState = state;
    this.notifyListeners();
  }
}

enum MenuState {
  JOURNEYS,
  MAP,
  PROFILE
}