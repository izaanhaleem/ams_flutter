// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class User {
  static Future<String?> login() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
/*  static Future<String?> Driverlogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }*/
}
