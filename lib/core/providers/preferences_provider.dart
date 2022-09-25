import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {

  static final AppPreferences _instance = AppPreferences._internal();

  factory AppPreferences() {
    return _instance;
  }

  AppPreferences._internal();

  SharedPreferences? _prefs;

  initPrefs() async{
    _prefs = await SharedPreferences.getInstance();
  }

  String? getValue(String key) => _prefs?.getString(key);

  void setValue(String key, String value) => _prefs?.setString(key, value);

  bool? getBooleanValue(String key) => _prefs?.getBool(key);

  void setBooleanValue(String key, bool value) => _prefs?.setBool(key, value);

  int? getIntValue(String key) => _prefs?.getInt(key);

  void setIntValue(String key, int value) => _prefs?.setInt(key, value);
}