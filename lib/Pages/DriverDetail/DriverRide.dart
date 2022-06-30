// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';
import 'package:ams_flutter/Controller/DriverProfileController.dart';
import 'package:ams_flutter/ResponseClass/DiverInfoId.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DriverNavigation.dart';
import 'MapUtils.dart';

class DriverRideInfo extends StatefulWidget {
  final int DriverId;
  final int SurgerId;
  final double carlatitude;
  final double carlongitude;
  // ignore: non_constant_identifier_names
  const DriverRideInfo({Key? key, this.SurgerId = 0 , this.DriverId = 0, this.carlatitude=0, this.carlongitude=0}) : super(key: key);

  @override
  _DriverRideInfoState createState() => _DriverRideInfoState();

}

class _DriverRideInfoState extends State<DriverRideInfo>  {
static double? carlatitude ;
static double? carlongitude;
 static SharedPreferences? preferences;

  Future<bool?> showWarning(BuildContext context) async => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context)=>DriverNavigation()), (Route<dynamic>route) => false);
  String country = '';
  String name = '';
  String street = '';
  String postalCode = '';
  final controller = ScrollController();
  final driverprofilecontroller = Get.put(DriverProfileController());
    String Address="";
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 0),
            () =>
            setState((){
              driverprofilecontroller.fetchRideInfo(widget.DriverId, widget.SurgerId, widget.carlatitude, widget.carlongitude);
             getLocation(widget.carlatitude, widget.carlongitude);
            }));
    super.initState();
    print(widget.SurgerId);
    print(widget.DriverId);

  }

  Future<void> getLocation(double carlatitude, double carlongitude) async {
    preferences = await SharedPreferences.getInstance();
    WidgetsFlutterBinding.ensureInitialized();
      carlatitude = (preferences!.getDouble('latitude') ?? 0);
      carlongitude = (preferences!.getDouble("longitude") ?? 0);
    List<Placemark> placemark = await placemarkFromCoordinates(carlatitude, carlongitude);
    print(placemark[0].street);
    setState(() {
      street = placemark[0].street!;
    });
    //await preferences!.clear();
  }
  @override
  Widget build(BuildContext context){

    return WillPopScope(
        child: Scaffold
      (
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
              "Ride Information"
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (driverprofilecontroller.RideList.isEmpty) {
                  return Center(child: Column(
                    children: [
                      CircularProgressIndicator(color: Colors.blue,),
                      Text("No Assign Ride")
                    ],
                    ),
                  );
                } else {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 0.9,
                          crossAxisCount: 2,
                          crossAxisSpacing: 0.1,
                          mainAxisExtent: 200),
                      controller: controller,
                      shrinkWrap: true,
                      itemCount: driverprofilecontroller.RideList.length,
                      itemBuilder: (BuildContext context, int index)  {
                        return buildNumber(index, driverprofilecontroller.RideList);
                      }
                  );
                }
              }),
            ),
          ],
        )
    ),
        onWillPop: () async{
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
    }
    );

  }
  Widget buildNumber(int indx, List<Ride> RideList) {
    WidgetsFlutterBinding.ensureInitialized();
    carlatitude = driverprofilecontroller.RideList[indx].latitude;
    carlongitude = driverprofilecontroller.RideList[indx].longitude;
/*    storagelatlong.write("latitude", carlatitude);
    storagelatlong.write("longitude", carlongitude);*/
   preferences!.setDouble("latitude", carlatitude!);
   preferences!.setDouble("longitude", carlongitude!);
   preferences!.reactive();
    return GestureDetector(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),

        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 2.0, 3.0, 4.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: [

                    Text("Driver Id: ",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                    SizedBox(width: 5.0,),
                    Flexible(child: Text(driverprofilecontroller.RideList[indx].driverId.toString(),))
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("Task Id: ",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                    SizedBox(width: 5.0,),
                    Flexible(child: Text(driverprofilecontroller.RideList[indx].id.toString(),))
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("Surger Id: ",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                    SizedBox(width: 5.0,),
                    Flexible(child: Text(driverprofilecontroller.RideList[indx].surgeryId.toString(),))
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  color: Colors.blueAccent,
                  child:Column(
                    children: [
                      Card(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Health Facility", style: TextStyle(fontWeight: FontWeight.bold),),
                        Icon(Icons.hotel_sharp),
                    ],
                  ),
                      ),
                      Card(
                        child: Column(
                          children: [
                        Row(
                        children: [
                        Text("Street: ",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        SizedBox(width: 5.0,),
                        Flexible(child:Text(street))
                        ],
                      ),
                            SizedBox(height: 5.0,),
                            Row(
                              children: [
                                Text("Location: ", style: TextStyle(fontWeight: FontWeight.bold),),
                                SizedBox(width: 5.0,),
                                Flexible(
                                  child:InkWell(
                                  onTap: () {
                                    MapUtils.openMap(driverprofilecontroller.RideList[indx].latitude!.toDouble(), driverprofilecontroller.RideList[indx].longitude!.toDouble());
                                  },
                                  child: Ink.image(
                                    image: AssetImage('assets/google_map.jpg'),
                                    fit: BoxFit.cover,
                                    width: 30,
                                    height: 30,
                                  ),
                                ))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

