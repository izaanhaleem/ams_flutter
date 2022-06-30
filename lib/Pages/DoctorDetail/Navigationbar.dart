// ignore_for_file: file_names

import 'package:ams_flutter/Pages/DoctorDetail/DoctorLogin.dart';
import 'package:ams_flutter/Pages/DoctorDetail/DoctorHomePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ProfilePage.dart';
import 'SettingPage.dart';

class Navigation extends StatefulWidget {

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index=0;

  final screens= [
    HomePage(),
    ProfilePage(),
    //SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final items =<Widget>[
      Icon(Icons.home, size: 30,),
      Icon(Icons.person, size: 30,),
     // Icon(Icons.settings, size: 30,),
    ];
    return Scaffold(
          body:
          screens[index],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              iconTheme: IconThemeData(color: Colors.white),
            ),
            child: CurvedNavigationBar(
              key: navigationKey,
            color: Colors.blue,
            buttonBackgroundColor: Colors.purple,
            height: 60,
            index: index,
            items: items,
            onTap: (index)=> setState(() {
              this.index= index;
            }),
          ),
          ),
    );
  }
  _logout() async {
    SharedPreferences sharePrefs = await SharedPreferences.getInstance();
    await sharePrefs.remove('token');
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        DoctorDesignLogin()), (Route<dynamic> route) => false);
  }
}
