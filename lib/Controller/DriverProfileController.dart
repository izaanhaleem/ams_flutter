// ignore: file_names
// ignore_for_file: file_names, unrelated_type_equality_checks

import 'package:ams_flutter/ResponseClass/DiverInfoId.dart';
import 'package:ams_flutter/ResponseClass/DriverProfile.dart';
import 'package:ams_flutter/ResponseClass/DriverResponse.dart';
import 'package:ams_flutter/Services/AMSapi.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriverProfileController extends GetxController{
  var isLoading = true.obs;
  var Tasklist = <DriverRe>[].obs;
  var TasklistComplete = <DriverRe>[].obs;

  var TasklistIncomplete = <DriverRe>[].obs;

  var TasklistPending = <DriverRe>[].obs;

  var RideList = <Ride>[].obs;
  // ignore: non_constant_identifier_names
  var DriverProfileInfo = DriverInfo().obs;
  var DriverCar = DriverCarInfo().obs;

  static double? carlatitude=0;
  static double? carlongitude=0;

  @override
  void onInit() {
   fetchJobList();
    fetchDriverInfo();
    fetchDriverCar();
    super.onInit();
  }
  //Driver Job List
  void fetchJobList() async {
    try {
      isLoading(true);
      var tasks = await AmsAPI.fetchDriverJobList("bearer");
      if (tasks != null) {
        Tasklist.clear();
        TasklistComplete.clear();
        TasklistIncomplete.clear();
        TasklistPending.clear();

        Tasklist.value = tasks;

        TasklistComplete.assignAll(Tasklist.value.where((element) => (element.surgeryJobStatus == 'Completed' ||
            element.surgeryJobStatus == 'Doctor Dropped Home')).toList());
        TasklistIncomplete.assignAll(Tasklist.value.where((element) => element.surgeryJobStatus=='Picking Doctor' ||
            element.surgeryJobStatus=='InProcess').toList());
        TasklistPending.assignAll(Tasklist.value.where((element) => element.surgeryJobStatus == 'Assigned').toList());

      }
    } finally {
      isLoading(false);
    }
  }
  //RideInformation
  void fetchRideInfo(int DriverId , int SurgerId, double carlatitude, double carlongitude) async {
    try {
      isLoading(true);
      RideList.clear();
      var rides = await AmsAPI.fetchRideList(DriverId,SurgerId,carlatitude,carlongitude);
      if (rides != null) {
        RideList.assignAll(rides.toList());
      }
    } finally {
      isLoading(false);
    }
  }

  // Driver Info
  void fetchDriverInfo() async {
    try {
      isLoading(true);
     await AmsAPI.fetchDriverProfile("bearer");
    } finally {
      isLoading(false);
    }
  }

  // Driver Car Infort=mation
  void fetchDriverCar() async {
    try {
      isLoading(true);
      await AmsAPI.fetchDriverCar("bearer");
    } finally {
      isLoading(false);
    }
  }
}