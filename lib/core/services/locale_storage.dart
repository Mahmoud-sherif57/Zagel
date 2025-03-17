import 'package:shared_preferences/shared_preferences.dart';

class AppLocaleStorage {
  static late SharedPreferences prefs;
  init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setCachData(key, value) {
    if (value is String) {
      prefs.setString(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      prefs.setStringList(key, value);
    }
  }

  static getCachData(key) {
    return prefs.get(key);
  }
}
