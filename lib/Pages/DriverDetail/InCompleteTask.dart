// ignore_for_file: file_names, unnecessary_new, prefer_const_constructors

import 'package:ams_flutter/Controller/DriverProfileController.dart';
import 'package:ams_flutter/Pages/DriverDetail/DriverRide.dart';
import 'package:ams_flutter/ResponseClass/DriverResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DriverInComplete extends StatefulWidget {
  const DriverInComplete({Key? key}) : super(key: key);

  @override
  _DriverInCompleteState createState() => _DriverInCompleteState();
}

class _DriverInCompleteState extends State<DriverInComplete> {
  static int? SurgerId;
  static int? DriverId;
  final controller = ScrollController();
  final drivertaskcontroller = Get.put(DriverProfileController());
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (drivertaskcontroller.TasklistIncomplete.isEmpty)
                  return Center(child: Text("No Task InCompleted",style: TextStyle(fontWeight: FontWeight.bold)));
                else {
                  return ListView.builder(
                      controller: controller,
                      shrinkWrap: true,
                      itemCount:drivertaskcontroller.TasklistIncomplete.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildNumber(index, drivertaskcontroller.TasklistIncomplete);
                      }
                  );
                }
              }),
            ),
          ],
        )
    );
  }
  Widget buildNumber(int indx, List<DriverRe> taskstList) {
    return GestureDetector(
      onTap: () async{
        SurgerId = drivertaskcontroller.TasklistIncomplete[indx].surgerId;
        DriverId = drivertaskcontroller.TasklistIncomplete[indx].driverId;

        SharedPreferences preferences= await SharedPreferences.getInstance();
        preferences.setInt("surgerId", SurgerId!);
        Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context)=>DriverRideInfo(
          DriverId: DriverId!, SurgerId: SurgerId!,
        )), (Route<dynamic>route) => false);
      },
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10, top: 25),
            height: 120,
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(100.0),
                    bottomRight: Radius.circular(100.0)
                  ),
          /*        boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.9),
                      offset: Offset(-10.0,0.0),
                      blurRadius: 20.0,
                      spreadRadius: 4.0,
                    )
                  ]*/
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0, top: 1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment:MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          "Press And View Ride Information",
                          style: TextStyle(fontWeight:  FontWeight.bold,
                            color: Colors.white,),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Driver Name: ",
                          style: TextStyle(fontWeight:  FontWeight.bold,
                            color: Colors.white,),
                        ),
                        SizedBox(width: 5.0,),
                        Flexible(child: Text(drivertaskcontroller.TasklistIncomplete[indx].driverName.toString(),
                            style: TextStyle(color: Colors.white)))
                      ],
                    ),
                    SizedBox(height: 5.0,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Text(
                          "Driver CNIC: ",
                          style: TextStyle(fontSize: 15, color: Colors.white,fontWeight:  FontWeight.bold),
                        ),
                        SizedBox(width: 5.0,height:10.0,),
                        Flexible(child: Text(drivertaskcontroller.TasklistIncomplete[indx].driverCnic.toString(),
                          style: TextStyle(color: Colors.white),))
                      ],
                    ),
                    SizedBox(height: 5.0,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start
                      ,
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Driver Shift: ",
                          style: TextStyle(fontSize: 15, color: Colors.white,fontWeight:  FontWeight.bold),
                        ),
                        SizedBox(width: 5.0,height:10.0,),
                        Flexible(child: Text(drivertaskcontroller.TasklistIncomplete[indx].driverShiftingTime.toString(),
                            style: TextStyle(color: Colors.white)))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
