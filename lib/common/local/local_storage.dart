import 'package:flutter_app/common/utils/common_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

///SharedPreferences 本地存储
class LocalStorage {
  static setString(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static setInt(String key, int value) async {
    await CommonUtils.getPermissions();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(key);
    print(value);
    prefs.setInt(key, value);
  }

  static getInt(String key) async {
    await CommonUtils.getPermissions();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }
}
