// ignore_for_file: file_names, curly_braces_in_flow_control_structures

import 'package:ams_flutter/Controller/DriverProfileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CountList.dart';
import 'DriverLogin.dart';
class DriverProfilePage extends StatefulWidget {
  final Widget? child;
  const DriverProfilePage({Key? key, this.child}) : super(key: key);

  @override
  _DriverProfilePageState createState() => _DriverProfilePageState();
}

class _DriverProfilePageState extends State<DriverProfilePage> {
  final controller = ScrollController();
  final driverprofilecontroller = Get.put(DriverProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Profile", textAlign: TextAlign.center,),
     /*     actions: <Widget>[
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
                )
              ],
            )
          ],*/
        ),
        body: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(height: 10.0,),
              DriverInformation(),
              SizedBox(height: 10.0,),
              DriverCarInformation(),
            ],
          ),
        )
    );
  }
Widget DriverCarInformation(){
    return Container(
      child: Card(
      color: Colors.purple,
      child: Column(
        children: [
          Text("Driver Car Information",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          Card(
            color: Colors.purple,
            child: Obx((){
              if (driverprofilecontroller.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return Container(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Registration Number: ",style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 5.0,),
                              Flexible(child: Text(driverprofilecontroller.DriverCar.value.registrationNumber.toString()))
                            ],
                          ),
                          Row(
                            children: [
                              Text("Car Maker: ", style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 5.0,),
                              Flexible(child: Text(driverprofilecontroller.DriverCar.value.carMaker.toString()))
                            ],
                          ),
                          Row(
                            children: [
                              Text("Car Model: ", style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 5.0,),
                              Flexible(child: Text(driverprofilecontroller.DriverCar.value.carModel.toString()))
                            ],
                          ),
                          Row(
                            children: [
                              Text("District Operation: ", style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 5.0,),
                              Flexible(child: Text(driverprofilecontroller.DriverCar.value.districtOperation.toString()))
                            ],
                          ),  Row(
                            children: [
                              Text("Color: ", style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 5.0,),
                              Flexible(child: Text(driverprofilecontroller.DriverCar.value.color.toString()))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
            }),
          )
        ],
      ),
      ),
    );
}
  Widget DriverInformation() {
    return Container(
      child: Card(
        color: Colors.purple,
        child: Column(
          children: [
            Text("Driver Profile",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),

            Card(
              color: Colors.purple,
              child: Obx((){
                if (driverprofilecontroller.isLoading.value)
                  return Center(child: CircularProgressIndicator());
                else
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Driver Name: ",style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 5.0,),
                              Flexible(child: Text(driverprofilecontroller.DriverProfileInfo.value.driverName.toString()))
                            ],
                          ),
                          Row(
                            children: [
                              Text("EmailAddress: ", style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 5.0,),
                              Flexible(child: Text(driverprofilecontroller.DriverProfileInfo.value.emailAddress.toString()))
                            ],
                          ),
                          Row(
                            children: [
                              Text("Phone Number: ", style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 5.0,),
                              Flexible(child: Text(driverprofilecontroller.DriverProfileInfo.value.phoneNumber.toString()))
                            ],
                          ),
                          Row(
                            children: [
                              Text("CNIC: ", style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 5.0,),
                              Flexible(child: Text(driverprofilecontroller.DriverProfileInfo.value.cnic.toString()))
                            ],
                          ),
                          Row(
                            children: [
                              Text("Address: ", style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 5.0,),
                              Flexible(child: Text(driverprofilecontroller.DriverProfileInfo.value.address.toString()))
                            ],
                          ),  Row(
                            children: [
                              Text("ShiftingTime: ", style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 5.0,),
                              Flexible(child: Text(driverprofilecontroller.DriverProfileInfo.value.shiftingTime.toString()))
                            ],
                          ),
                          Row(
                            children: [
                              Text("Company Name: ", style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 5.0,),
                              Flexible(child: Text(driverprofilecontroller.DriverProfileInfo.value.companyName.toString()))
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
              }),
            )
          ]
        ),
      ),
    );
  }
/*  _logout() async {
    SharedPreferences sharePrefs = await SharedPreferences.getInstance();
    await sharePrefs.remove('token');
   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>
       DriverLoginDesign()), (Route<dynamic>route) => false);
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
  }*/
}
