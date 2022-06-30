// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ams_flutter/Controller/DriverProfileController.dart';
import 'package:ams_flutter/Pages/DriverDetail/DriverRide.dart';
import 'package:ams_flutter/ResponseClass/DriverResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DriverAssignTask extends StatefulWidget {
  const DriverAssignTask({Key? key}) : super(key: key);

  @override
  _DriverAssignTaskState createState() => _DriverAssignTaskState();
}

class _DriverAssignTaskState extends State<DriverAssignTask> {
  static int? SurgerId;
  static int? DriverId;
  final controller = ScrollController();
  final drivertaskcontroller = Get.put(DriverProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (drivertaskcontroller.TasklistPending.isEmpty)
                  return Center(child: Text("No Task Assigned...",style: TextStyle(fontWeight: FontWeight.bold)));
                else
                  // ignore: curly_braces_in_flow_control_structures
                  return ListView.builder(
                      controller: controller,
                      shrinkWrap: true,
                      itemCount:drivertaskcontroller.TasklistPending.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildNumber(index, drivertaskcontroller.TasklistPending);
                      }
                  );
              }),
            ),
          ],
        )
    );
  }
  Widget buildNumber(int indx, List<DriverRe> taskstList) {
    return GestureDetector(
      onTap: ()async{
        SurgerId = drivertaskcontroller.TasklistPending[indx].surgerId;
        DriverId = drivertaskcontroller.TasklistPending[indx].driverId;
        SharedPreferences preferences = await SharedPreferences.getInstance();
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
                  color: Colors.red,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(100.0),
                    bottomRight: Radius.circular(100.0)
                  ),
            /*      boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.9),
                      offset: Offset(-10.0,0.0),
                      blurRadius: 20.0,
                      spreadRadius: 4.0,
                    )
                  ]*/
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0,right: 0.0, bottom: 0.0, top: 1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment:MainAxisAlignment.center,
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
                        Text(
                          "Driver Name: ",
                          style: TextStyle(fontWeight:  FontWeight.bold,
                            color: Colors.white,),
                        ),
                        SizedBox(width: 5.0,),
                        Flexible(child: Text(drivertaskcontroller.TasklistPending[indx].driverName.toString(),
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
                        Flexible(child: Text(drivertaskcontroller.TasklistPending[indx].driverCnic.toString(),
                          style: TextStyle(color: Colors.white),))
                      ],
                    ),
                    SizedBox(height: 5.0,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start
                      ,
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Text(
                          "Driver Shift: ",
                          style: TextStyle(fontSize: 15, color: Colors.white,fontWeight:  FontWeight.bold),
                        ),
                        SizedBox(width: 5.0,height:10.0,),
                        Flexible(child: Text(drivertaskcontroller.TasklistPending[indx].driverShiftingTime.toString(),
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
