// ignore_for_file: file_names

import 'package:ams_flutter/Pages/DriverDetail/DriverLogin.dart';
import 'package:ams_flutter/Services/AMSapi.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var loginProcess = false.obs;
  var error = "";

  Future<String> login({String? email, String? password}) async {
    error = "";
    try {
      loginProcess(true);
      List loginResp = await AmsAPI.login(name: email, password: password,grant_type: "token");
      if (loginResp[0] != "") {
        //success
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("token", loginResp[0]);
        prefs.setString("id", loginResp[1]);
      } else {
        error = loginResp[1];
      }
    } finally {
      loginProcess(false);
    }
    return error;
  }
  //CMS Login

  Future<String> Driverlogin({String? email, String? password}) async {
    error = "";
    try {
      loginProcess(true);
      List loginResp = await AmsAPI.Driverlogin(name: email, password: password,grant_type: "token");
      if (loginResp[0] != "") {
        //success
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("token", loginResp[0]);
        prefs.setString("id", loginResp[1]);
      } else {
        error = loginResp[1];
      }
    } finally {
      loginProcess(false);
    }
    return error;
  }

  Future<bool> isUserLogin() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    String? userID = prefs.getString("id");

    if (token == null && userID ==null) {
      return false;
    }else{
      return true;
    }
  }

}
