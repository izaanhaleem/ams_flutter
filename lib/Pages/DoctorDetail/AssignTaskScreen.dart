// ignore_for_file: file_names, unnecessary_new

import 'package:ams_flutter/Controller/DoctorProfileController.dart';
import 'package:ams_flutter/ResponseClass/JobListResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
class AssignTaskScreen extends StatefulWidget {
  const AssignTaskScreen({Key? key}) : super(key: key);

  @override
  _AssignTaskScreenState createState() => _AssignTaskScreenState();
}

class _AssignTaskScreenState extends State<AssignTaskScreen> {
  final taskcontroller = Get.put(ProfileController());
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return new Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (taskcontroller.TasklistAssign.isEmpty) {
                  return Center(child: Text("No Task Assigned ...",style: TextStyle(fontWeight: FontWeight.bold),));
                } else {
                  return ListView.builder(
                      controller: controller,
                      shrinkWrap: true,
                      itemCount: taskcontroller.TasklistAssign.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildNumber(index, taskcontroller.TasklistAssign );
                      }
                  );
                }
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
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100.0),
                  bottomRight: Radius.circular(100.0)
                ),
            /*    boxShadow: [
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
                    const Text(
                      "Doctor Name: ",
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5.0,),
                    Flexible(child: Text(
                      taskcontroller.TasklistAssign[indx].doctorName.toString(),
                    ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Patient Name: ",
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5.0,),
                    Flexible(child: Text(
                      taskcontroller.TasklistAssign[indx].patientName.toString(),
                    ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Surgery Type: ",
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5.0,),
                    Flexible(child: Text(
                      taskcontroller.TasklistAssign[indx].surgeryType.toString(),
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
                      taskcontroller.TasklistAssign[indx].driverName.toString(),
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
}
