// ignore_for_file: file_names
import 'package:ams_flutter/ResponseClass/JobListResponse.dart';
import 'package:ams_flutter/ResponseClass/ProfileResponse.dart';
import 'package:ams_flutter/Services/AMSapi.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isLoading = true.obs;
  var DocumnetList = <DoctorDocument>[].obs;
  var PrefrenceList = <DoctorPreference>[].obs;
  var ProfileList = DoctorProfileInfomation().obs;
  var Tasklist = <Re>[].obs;

  var TasklistComplete =<Re>[].obs;

  var TasklistInComplete =<Re>[].obs;

  var TasklistAssign =<Re>[].obs;



  @override
  void onInit() {
    fetchDocumnetList();
    fetchPrefrenceList();
    fetchProfileList();
    fetchJobList();
    super.onInit();
  }

  //Doctor Task list
  void fetchJobList() async {
    try {
      isLoading(true);
      var tasks = await AmsAPI.fetchJobList("bearer");
       if (tasks != null) {
        Tasklist.clear();
        TasklistComplete.clear();
        TasklistInComplete.clear();
        TasklistAssign.clear();

        Tasklist.value = tasks;
        //Task List: Completed Tsk list, Incomplete Tsk List, Assign Tsk List And All Count Lists.
        TasklistComplete.assignAll(Tasklist.value.where((complete) => (complete.surgeryCurrentStatus=="Completed" ||
            complete.surgeryCurrentStatus=="Done" || complete.surgeryCurrentStatus=="Completed & Verified")).toList());

        TasklistInComplete.assignAll(Tasklist.value.where((incomplete) => incomplete.surgeryCurrentStatus=="InProcess").toList());

        TasklistAssign.assignAll(Tasklist.value.where((assign) => assign.surgeryCurrentStatus == "Assigned").toList());


      }
    } finally {
      isLoading(false);
    }
  }

  //Doctor Document List
  void fetchDocumnetList() async {
    try {
      isLoading(true);
      var document = await AmsAPI.fetchDocumnetList("bearer");
      if (document != null) {
        DocumnetList.value = document;
      }
    } finally {
      isLoading(false);
    }
  }

  //Doctor Prefrence List
  void fetchPrefrenceList() async {
    try {
      isLoading(true);
      var prefrence = await AmsAPI.fetchPrefrenceList("bearer");
      if (prefrence != null) {
        PrefrenceList.value = prefrence;
      }
    } finally {
      isLoading(false);
    }
  }

  //Doctor Profile List
  void fetchProfileList() async {
    try {
      isLoading(true);
       await AmsAPI.fetchProfileList("bearer");
    } finally {
      isLoading(false);
    }
  }
}