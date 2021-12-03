
// Shared Preferences Template

import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefs {

  static final SharedPrefs _instance = SharedPrefs._internal();

  factory SharedPrefs() {
    return _instance;
  }

  SharedPrefs._internal();

  SharedPreferences _prefs;

  initPrefs() async{

    _prefs = await SharedPreferences.getInstance();

  }

  get uid {
    return _prefs.getString('uid');
  }

  set uid( String value ) {
    _prefs.setString('uid', value);
  }

}
