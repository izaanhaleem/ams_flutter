import 'package:ams_flutter/Controller/HomeControlPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'animation_screen.dart';

Future<void> main() async {
  late SharedPreferences prefrences;
  WidgetsFlutterBinding.ensureInitialized();
  prefrences = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FamilyFolder',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeControlPage(),
        routes:{
        }
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(
            children: <Widget>[
              Scaffold(
                  body: HomeControlPage()
              ),
              IgnorePointer(
                  child: AnimationScreen(
                      color: Theme.of(context).accentColor
                  )
              )
            ]
        )
    );
  }
}
