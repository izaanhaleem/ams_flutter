// ignore_for_file: file_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DriverHomePage.dart';
import 'DriverProfile.dart';

class DriverNavigation extends StatefulWidget {

  @override
  _DriverNavigationState createState() => _DriverNavigationState();
}

class _DriverNavigationState extends State<DriverNavigation> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index=0;

  final screens= [
    DriverHomePage(),
    DriverProfilePage(),
    //DriverRideInfo(),
  ];
  @override
  Widget build(BuildContext context) {
    final items =<Widget>[
      Icon(Icons.home, size: 30,),
      Icon(Icons.person, size: 30,),
    // Icon(Icons.directions_bus, size: 30,),
    ];
    return Scaffold(
   /*   endDrawer: Drawer(
        elevation: 16.0,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Image.asset("assets/health.png"),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
                title: new Text("Log Out"),
                leading: new Icon(Icons.inbox),
                onTap: () async {
                  _logout();
                }),
            ListTile(
              title: Text("Dashboard"),
              leading: Icon(Icons.assignment),
              onTap: () async{
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CountList()));
              },
            )
          ],
        ),
      ),*/
      body: screens[index],
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
/*  _logout() async {
    SharedPreferences sharePrefs = await SharedPreferences.getInstance();
    await sharePrefs.remove('token');
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext ctx) => DriverLoginDesign()));
  }*/
}