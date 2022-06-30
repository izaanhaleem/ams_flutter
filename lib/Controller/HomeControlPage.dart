// ignore_for_file: file_names
import 'package:ams_flutter/Pages/DoctorDetail/DoctorHomePage.dart';
import 'package:ams_flutter/Pages/DoctorDetail/Navigationbar.dart';
import 'package:ams_flutter/Pages/DriverDetail/DriverLogin.dart';
import 'package:ams_flutter/ResponseClass/User.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'LoginController.dart';
import '../Pages/DoctorDetail/DoctorLogin.dart';
class HomeControlPage extends StatefulWidget {
  @override
  _HomeControlPageState createState() => _HomeControlPageState();
}

class _HomeControlPageState extends State<HomeControlPage> {

  final LoginController controller = Get.put(LoginController());

  Future<Widget> goto() async {
    String? token = await User.login();
  //  String? drivertoken = await User.Driverlogin();
    if (token != null) {
      bool refresh = await controller.isUserLogin();
      if (refresh) {
        return DoctorDesignLogin();
      }
    }
  return HomePage();
  }
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: goto(),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("");
          } else {
            return Center(child: snapshot.data);
          }
        });
  }

}
