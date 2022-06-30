// ignore_for_file: file_names, prefer_const_constructors

import 'package:ams_flutter/Controller/DoctorProfileController.dart';
import 'package:ams_flutter/Pages/DoctorDetail/Navigationbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

import 'DoctorLogin.dart';
class CircularMenu extends StatefulWidget {
  const CircularMenu({Key? key}) : super(key: key);

  @override
  _CircularMenuState createState() => _CircularMenuState();
}

class _CircularMenuState extends State<CircularMenu> {
  final controller = ScrollController();
  final countListcontroller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SpinCircleBottomBarHolder(
          bottomNavigationBar: SCBottomBarDetails(
              circleColors: [Colors.blue, Colors.orange, Colors.yellow, Colors.green,],
              iconTheme: IconThemeData(color: Colors.black45),
              activeIconTheme: IconThemeData(color: Colors.orange),
              backgroundColor: Colors.white,
              titleStyle: TextStyle(color: Colors.black45,fontSize: 12),
              activeTitleStyle: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),
              actionButtonDetails: SCActionButtonDetails(
                  color: Colors.blue,
                  icon: Icon(
                    Icons.expand_less,
                    color: Colors.white,
                  ),
                  elevation: 2),
              elevation: 4.0,
              items: [
                // Suggested count : 4
           /*     SCBottomBarItem(icon: Icons.verified_user, title: "User", onPressed: () {}),
                SCBottomBarItem(icon: Icons.supervised_user_circle, title: "Details", onPressed: () {}),
                SCBottomBarItem(icon: Icons.notifications, title: "Notifications", onPressed: () {}),
                SCBottomBarItem(icon: Icons.details, title: "New Data", onPressed: () {}),*/
              ],
              circleItems: [
                //Suggested Count: 3
                SCItem(icon: Icon(Icons.home), onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      Navigation()), (Route<dynamic> route) => false);
                }),
                SCItem(icon: Icon(Icons.logout), onPressed: () {
                  _logout();
                }),
              ],
              bnbHeight: 80 // Suggested Height 80
          ),
          child:  Column(
            children: [
              Container(
                height: 230,
                decoration: BoxDecoration(
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
                  ],
                ),
              ),
              SizedBox(height: height*0.01,),
              Container(
                height: 200,
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
                                        )
                                    )
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
              ),
            ],
          )
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

