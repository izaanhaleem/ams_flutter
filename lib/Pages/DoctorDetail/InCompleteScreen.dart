// ignore_for_file: file_names, unnecessary_new, prefer_const_constructors, curly_braces_in_flow_control_structures
import 'package:ams_flutter/Controller/DoctorProfileController.dart';
import 'package:ams_flutter/ResponseClass/JobListResponse.dart';
import 'package:ams_flutter/Services/AMSapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class InCompleteScreen extends StatefulWidget {
  const InCompleteScreen({Key? key}) : super(key: key);
  @override
  _InCompleteScreenState createState() => _InCompleteScreenState();
}

class _InCompleteScreenState extends State<InCompleteScreen> {
  final taskcontroller = Get.put(ProfileController());
  final controller = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return new Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (taskcontroller.TasklistInComplete.isEmpty)
                  return Center(child: Text("No Task InCompleted...",style: TextStyle(fontWeight: FontWeight.bold)));
                else
                  return ListView.builder(
                      controller: controller,
                      shrinkWrap: true,
                      itemCount: taskcontroller.TasklistInComplete.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildNumber(index, taskcontroller.TasklistInComplete );
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
                color: Colors.green,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(100.0),
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
                      taskcontroller.TasklistInComplete[indx].doctorName.toString(),
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
                      taskcontroller.TasklistInComplete[indx].patientName.toString(),
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
                      taskcontroller.TasklistInComplete[indx].surgeryType.toString(),
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
                      taskcontroller.TasklistInComplete[indx].driverName.toString(),
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
