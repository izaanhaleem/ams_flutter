// ignore_for_file: file_names, unnecessary_new, curly_braces_in_flow_control_structures, prefer_const_constructors
import 'package:ams_flutter/Controller/DoctorProfileController.dart';
import 'package:ams_flutter/ResponseClass/JobListResponse.dart';
import 'package:ams_flutter/ResponseClass/ProfileResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:http/http.dart' as http;

import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompleteTask extends StatefulWidget {
  final Widget? child;
   CompleteTask({Key? key, this.child}) : super(key: key);
  @override
  _CompleteTaskState createState() => _CompleteTaskState();
}

class _CompleteTaskState extends State<CompleteTask> {
  final controller = ScrollController();
  final taskcontroller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return new Scaffold(
      body: Column(
    children: [
    Expanded(
    child: Obx(() {
      if (taskcontroller.TasklistComplete.isEmpty)
        return Center(child: Text("No Task Completed....",style: TextStyle(fontWeight: FontWeight.bold),));
      else
        return ListView.builder(
            controller: controller,
            shrinkWrap: true,
            itemCount: taskcontroller.TasklistComplete.length,
            itemBuilder: (BuildContext context, int index) {
              return buildNumber(index, taskcontroller.TasklistComplete );
            }
        );
    }),
    ),
    ],
      )
    );
  }
  Widget buildNumber(int indx, List<Re> taskstList) {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),

        child: Container(
          margin: const EdgeInsets.only(bottom: 10, top: 25),
          height: 100,
          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(100.0),
                topLeft: Radius.circular(100.0)
              ),
     /*         boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.9),
                  offset: Offset(-10.0,0.0),
                  blurRadius: 20.0,
                  spreadRadius: 4.0,
                )
              ]*/
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Doctor Name: ",
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5.0,),
                    Flexible(child: Text(
                      taskcontroller.TasklistComplete[indx].doctorName.toString(),
                    ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Patient Name: ",
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5.0,),
                    Flexible(child: Text(
                      taskcontroller.TasklistComplete[indx].patientName.toString(),
                    ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Surgery Type: ",
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5.0,),
                    Flexible(child: Text(
                      taskcontroller.TasklistComplete[indx].surgeryType.toString(),
                    ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Driver Name: ",
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5.0,),
                    Flexible(child: Text(
                      taskcontroller.TasklistComplete[indx].driverName.toString(),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
/*  Future<List<Re>> setJobList(List<Re> jobList) async {
    for (var i = 0; i < jobList.length; i++) {
      if (jobList
          .elementAt(i)
          .surgeryCurrentStatus != null.toString().compareTo("Completed")) {
        completeStatus.add(jobList.elementAt(i));
      }
    }
    return completeStatus;
  }*/
}
