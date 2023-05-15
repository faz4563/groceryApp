// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static saveStringtoLocalStorage(key, value) async {
    final prefs = await SharedPreferences.getInstance();
    var savingStringData = prefs.setString(key, value);
    return savingStringData;
  }

  static saveBooltoLocalStorage(key, value) async {
    final prefs = await SharedPreferences.getInstance();
    var savingBoolData = prefs.setBool(key, value);
    return savingBoolData;
  }

  static getStringFromLocalStorage(key) async {
    final prefs = await SharedPreferences.getInstance();
    var gettingStringData = prefs.getString(key);
    return gettingStringData;
  }

  static getBooltoLocalStorage(key) async {
    final prefs = await SharedPreferences.getInstance();
    var savingBoolData = prefs.getBool(key);
    return savingBoolData;
  }
}
