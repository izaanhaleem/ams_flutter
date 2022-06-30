// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ams_flutter/Controller/LoginController.dart';
import 'package:ams_flutter/Pages/DoctorDetail/DoctorLogin.dart';
import 'package:ams_flutter/ResponseClass/LoginRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'DriverNavigation.dart';
class DriverLoginDesign extends StatefulWidget {
  const DriverLoginDesign({Key? key}) : super(key: key);

  @override
  _DriverLoginDesignState createState() => _DriverLoginDesignState();
}

class _DriverLoginDesignState extends State<DriverLoginDesign> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final LoginController controller = Get.put(LoginController());
  late LoginRequest loginRequest;
  bool isApiCallProcess = false;
  var _nameTextController = TextEditingController(text: "ArslanTestdriver");
  var _passwordTextController = TextEditingController(text: "123456");
  var _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                    child: Text("Anesthesia Management System",style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),)),
              ],
            ),
          ),
          SizedBox(height: height*0.05,),
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
                Positioned(
                    top:0,
                    left: 30,
                    child: Card(
                      elevation: 10.0,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                fit: BoxFit.fill, image: AssetImage("assets/anthesia.jpg")
                            )
                        ),
                      ),
                    )
                ),
                Positioned(
                    top: 45,
                    left: 160,
                    child: Container(
                      height: 300,
                      width: 180,
                      child:Column (
                        children: [
                          Text("Driver Login ",style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),),
                           Form(
                              key: _formKey,
                              child:Center(
                                child: Container(
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 8),
                                        TextFormField(
                                          enabled: !controller.loginProcess.value,
                                          controller: _nameTextController,
                                          decoration: InputDecoration(
                                              icon: Icon(Icons.person), labelText: "Name"),
                                        ),
                                        SizedBox(height: 8),
                                        TextFormField(
                                          enabled: !controller.loginProcess.value,
                                          controller: _passwordTextController,
                                          decoration: InputDecoration(
                                              icon: Icon(Icons.lock),
                                              labelText: "Password",
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  _passwordVisible
                                                      ? Icons.visibility_off
                                                      : Icons.visibility,
                                                  color: Theme.of(context).primaryColorDark,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    _passwordVisible = !_passwordVisible;
                                                  });
                                                },
                                              )),
                                          obscureText: !_passwordVisible,
                                          validator: (String? value) => value!.trim().isEmpty
                                              ? "Password is require"
                                              : null,
                                        ),
                                        SizedBox(height: 10),
                                        Material(
                                          elevation: 5.0,
                                          borderRadius: BorderRadius.circular(30),
                                          color: controller.loginProcess.value
                                              ? Theme.of(context).disabledColor
                                              : Theme.of(context).primaryColor,
                                          child: MaterialButton(
                                            minWidth: MediaQuery.of(context).size.width,
                                            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                            onPressed: () async {
                                              if (_formKey.currentState!.validate()) {
                                                String error = await controller.Driverlogin(
                                                    email: _nameTextController.text,
                                                    password: _passwordTextController.text);
                                                if (error != "") {
                                                  Get.defaultDialog(
                                                      title: "Oop!", middleText: error);
                                                } else {
                                                  Navigator.of(context).pushAndRemoveUntil(
                                                      MaterialPageRoute(builder: (context)=>DriverNavigation()), (Route<dynamic>route) => false);
                                                }
                                              }
                                            },
                                            child: Text(
                                              "Login",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )
                                      ]),
                                ),
                              )
                          ),
                          SizedBox(height: 10.0,),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                  DoctorDesignLogin()), (Route<dynamic> route) => false);
                            },
                            child: Column(
                              children: [
                                Text(
                                  "Doctor LOGIN?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
