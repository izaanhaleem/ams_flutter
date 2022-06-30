// ignore_for_file: file_names, unnecessary_new, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ams_flutter/Pages/DriverDetail/DriverLogin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AssignTask.dart';
import 'CompleteTask.dart';
import 'CountList.dart';
import 'InCompleteTask.dart';

class DriverHomePage extends StatefulWidget {
  @override
  _DriverHomePageState createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Task Dashboard'),
          actions: <Widget>[
            PopupMenuButton<int>(
              color: Colors.white,
              elevation: 80,
              shape: CircleBorder(),
              onSelected: (item)=>onSelected(context, item),
              child: Icon(Icons.menu,color: Colors.white,),
              itemBuilder: (context)=>[
                PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Dashboard", style: TextStyle(fontWeight: FontWeight.bold),),
                      Icon(Icons.dashboard, color: Colors.black,)
                    ],),
                ),
                PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Log out", style: TextStyle(fontWeight: FontWeight.bold),),
                        Icon(Icons.logout, color: Colors.black,)
                      ],)
                ),
                PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("", style: TextStyle(fontWeight: FontWeight.bold),),
                        Icon(Icons.logout, color: Colors.white,)
                      ],)
                )
              ],
            )
          ],
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                color: Colors.lightBlueAccent
            ),
            tabs: [
              Tab(text: "Completed Task"),
              Tab(text: "In-Complete Task"),
              Tab(text: "Assigned Task"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            DriverCompleteTask(),
            DriverInComplete(),
            DriverAssignTask()
          ],
        ),
      ),
    );
  }
  _logout() async {
    SharedPreferences sharePrefs = await SharedPreferences.getInstance();
    await sharePrefs.remove('token');
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        DriverLoginDesign()), (Route<dynamic> route) => false);
  }
  onSelected(BuildContext context, int item) {
    switch(item){
      case 0:
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            CountList()), (Route<dynamic> route) => false);
        break;
      case 1:
        _logout();
        break;
    }
  }
}
