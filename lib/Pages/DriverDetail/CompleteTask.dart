// ignore_for_file: file_names, unnecessary_new, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:ams_flutter/Controller/DriverProfileController.dart';
import 'package:ams_flutter/Pages/DriverDetail/DriverRide.dart';
import 'package:ams_flutter/ResponseClass/DriverResponse.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class DriverCompleteTask extends StatefulWidget {

  const DriverCompleteTask({Key? key}) : super(key: key);

  @override
  _DriverCompleteTaskState createState() => _DriverCompleteTaskState();
}

class _DriverCompleteTaskState extends State<DriverCompleteTask> {
  static int? SurgerId;
  static int? DriverId;
  final controller = ScrollController();
  final drivertaskcontroller = Get.put(DriverProfileController());


  @override
  void initState() {
     //fetchDriverJobList("bearer");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (drivertaskcontroller.TasklistComplete.isEmpty)
                  return Center(child: Text("No Task Completed",style: TextStyle(fontWeight: FontWeight.bold)));
                else {
                  return ListView.builder(
                      controller: controller,
                      shrinkWrap: true,
                      itemCount:drivertaskcontroller.TasklistComplete.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildNumber(index, drivertaskcontroller.TasklistComplete);
                      }
                  );
                }
              },
              ),
            ),
          ],
        )
    );
  }
  Widget buildNumber(int indx, List<DriverRe> taskstList) {
    return GestureDetector(
      onTap: () async{
        SurgerId = drivertaskcontroller.TasklistComplete[indx].surgerId;
        DriverId = drivertaskcontroller.TasklistComplete[indx].driverId;

        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setInt('surgerId',SurgerId!);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (context) =>DriverRideInfo(
             DriverId: DriverId!, SurgerId:SurgerId!)),(Route<dynamic> route)=>false);
       /* Navigator.of(context).pushAndRemoveUntil(DriverRideInfo(
          DriverId: DriverId!, SurgerId: SurgerId!), (Route<dynamic> route) => false);*/
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
         child: Container(
                margin: const EdgeInsets.only(bottom: 10, top: 25),
                height: 140,
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                child: Container(
                decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(100.0),
                  bottomLeft: Radius.circular(100.0),
                ),
        /*        boxShadow: [
                BoxShadow(
                color: Colors.blue.withOpacity(0.9),
                offset: const Offset(-10.0,0.0),
            blurRadius: 20.0,
            spreadRadius: 4.0,
            )
            ]*/
            ),
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0, top: 1.0, right: 0.0,bottom: 0.0),
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
                    const Text(
                      "Surger Id: ",
                      style: TextStyle(fontWeight:  FontWeight.bold,
                        color: Colors.white,),
                    ),
                    SizedBox(width: 5.0,),
                    Flexible(child: Text(drivertaskcontroller.TasklistComplete[indx].surgerId.toString(),
                        style: TextStyle(color: Colors.white)))
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
                    Flexible(child: Text(drivertaskcontroller.TasklistComplete[indx].driverName.toString(),
                        style: TextStyle(color: Colors.white)))
                  ],
                ),
                SizedBox(height: 5.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Driver CNIC: ",
                      style: TextStyle(fontSize: 15, color: Colors.white,fontWeight:  FontWeight.bold),
                    ),
                    SizedBox(width: 5.0,height:10.0,),
                    Flexible(child: Text(drivertaskcontroller.TasklistComplete[indx].driverCnic.toString(),
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
                    Flexible(child: Text(drivertaskcontroller.TasklistComplete[indx].driverShiftingTime.toString(),
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
