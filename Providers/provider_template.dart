import 'package:flutter/widgets.dart';

class Template extends ChangeNotifier {

  bool _param = true;

  bool get param => _isActive;

  set changeParam(bool param) {
    _param = param;    
    // Communicate new state
    notifyListeners();
  }

}
