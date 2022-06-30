// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ams_flutter/Controller/DoctorProfileController.dart';
import 'package:ams_flutter/Pages/DoctorDetail/CircularMenu.dart';
import 'package:ams_flutter/Pages/DoctorDetail/DoctorLogin.dart';
import 'package:ams_flutter/Pages/DoctorDetail/Navigationbar.dart';
import 'package:ams_flutter/ResponseClass/ProfileResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CountList extends StatefulWidget {
  const CountList({Key? key}) : super(key: key);

  @override
  _CountListState createState() => _CountListState();
}

class _CountListState extends State<CountList> {
  final controller = ScrollController();
  final countListcontroller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    // ignore: unnecessary_new
    return new Scaffold(
      body: Column(
        children: [
          Container(
            height: 230,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
              color: Colors.blue,
            ),
            child: Stack(
              children: [
                Positioned(
                    top:80,
                    left: 0 ,
                    child: Container(
                      height: 100,
                      width: 320,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    )
                ),
                Positioned(
                    top: 115,
                    left: 20,
                    child: Text(
                      "Anesthesia Management System",
                      style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),)),
                Positioned(
                    top: 180,
                    left: 260,
                    child: PopupMenuButton<int>(
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
                              Text("Home Page",style: TextStyle(fontWeight: FontWeight.bold),),
                              Icon(Icons.home,color: Colors.black,)
                            ],),
                        ),
                        PopupMenuItem<int>(
                            value: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Log out",style: TextStyle(fontWeight: FontWeight.bold),),
                                Icon(Icons.logout, color: Colors.black,)
                              ],)
                        ),
                        PopupMenuItem<int>(
                            value: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Circular",style: TextStyle(fontWeight: FontWeight.bold),),
                                Icon(Icons.logout, color: Colors.black,)
                              ],)
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
          SizedBox(height: height*0.01,),
          Container(
            height: 300,
            child: Stack(
              children: [
                Positioned(
                  top: 35,
                  left: 20,
                  child: Material(
                    child: Container(
                        height: 350.0,
                        width: width*0.9,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(0.0),
                          boxShadow:[ BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              offset: new Offset(-10.0, 10.0),
                              blurRadius: 20.0,
                              spreadRadius: 4.0)],
                        )
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 300,),
                    Positioned(
                      top: 60,
                      child: Material(
                        child: Container(
                            height: 100,
                            width: 90,
                            child: Stack(
                              children: [
                                Positioned(
                                  top:0,
                                  left: 30,
                                  child: Material(
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                              fit: BoxFit.fill, image: AssetImage("assets/anthesia.jpg")
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 40,
                                    left: 10,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text("Completed",style: TextStyle(fontWeight: FontWeight.bold,),),
                                          SizedBox(height: 10,),
                                          Text("${countListcontroller.TasklistComplete.length}", style: TextStyle(
                                              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20
                                          ),),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow:[ BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  offset: new Offset(-10.0, 10.0),
                                  blurRadius: 20.0,
                                  spreadRadius: 4.0)],
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      child: Material(
                        child: Container(
                            height: 100,
                            width: 90,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  left: 30,
                                  child: Material(
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                              fit: BoxFit.fill, image: AssetImage("assets/anthesia.jpg")
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 40,
                                    left: 8,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text("InCompleted",style: TextStyle(fontWeight: FontWeight.bold,),),
                                          SizedBox(height: 10,),
                                          Text("${countListcontroller.TasklistInComplete.length}", style: TextStyle(
                                              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20
                                          ),),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow:[ BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  offset: new Offset(-10.0, 10.0),
                                  blurRadius: 20.0,
                                  spreadRadius: 4.0)],
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      child: Material(
                        child: Container(
                            height: 100,
                            width: 90,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  left: 30,
                                  child: Material(
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                              fit: BoxFit.fill, image: AssetImage("assets/anthesia.jpg")
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 40,
                                    left: 10,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text("Assigned",style: TextStyle(fontWeight: FontWeight.bold,),),
                                          SizedBox(height: 10,),
                                          Text("${countListcontroller.TasklistAssign.length}", style: TextStyle(
                                              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20
                                          ),),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow:[ BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  offset: new Offset(-10.0, 10.0),
                                  blurRadius: 20.0,
                                  spreadRadius: 4.0)],
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  onSelected(BuildContext context, int item) {
    switch(item){
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Navigation()));
        break;
      case 1:
        _logout();
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CircularMenu()));
        break;
    }
  }
  _logout() async {
    SharedPreferences sharePrefs = await SharedPreferences.getInstance();
    await sharePrefs.remove('token');
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext ctx) => DoctorDesignLogin()));
  }
}
