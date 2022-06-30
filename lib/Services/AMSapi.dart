// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';
import 'package:ams_flutter/Controller/DoctorProfileController.dart';
import 'package:ams_flutter/Controller/DriverProfileController.dart';
import 'package:ams_flutter/ResponseClass/DiverInfoId.dart';
import 'package:ams_flutter/ResponseClass/DriverProfile.dart';
import 'package:ams_flutter/ResponseClass/DriverResponse.dart';
import 'package:ams_flutter/ResponseClass/ErrorResp.dart';
import 'package:ams_flutter/ResponseClass/JobListResponse.dart';
import 'package:ams_flutter/ResponseClass/LoginResponse.dart';
import 'package:ams_flutter/ResponseClass/ProfileResponse.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AmsAPI {
  static ProfileController profilecontroller = Get.put(ProfileController());
  static DriverProfileController driverProfileController = Get.put(DriverProfileController());
  static String? token;
  static String? userid;
  static Dio _dio = Dio(
    BaseOptions(
      //baseUrl : "https://ams.pshealthpunjab.gov.pk",
      baseUrl: 'https://hcms.pshealthpunjab.gov.pk',
      //baseUrl: 'https://evaccs.pshealthpunjab.gov.pk/api/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );
  static var client = http.Client();
  static var _baseURL = "https://ams.pshealthpunjab.gov.pk";
  static var _baseURLCMS ="https://hcms.pshealthpunjab.gov.pk";

/*  Future<LoginResponse?> createUser({required LoginResponse userInfo}) async {
    LoginResponse? retrievedUser;

    try {
      var response = await _dio.post(
        '/users',
        data: userInfo.toJson(),
      );

      print('User created: ${response.data}');

      retrievedUser = LoginResponse.fromJson(response.data);
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrievedUser;
  }*/

  //AMS Logins:
  static Future<List> login({String? name, String? password, String? grant_type}) async {
    Map<String, dynamic> jsonMap = {
      "username":"arslanzafar250@gmail.com",
      "password":"123456",
      "grant_type": "password",
    };
    _dio.options.headers['content-Type'] = "application/x-www-form-urlencoded";
    var response = await _dio.post(('/Token'),
        options: Options(
          method: 'POST',
          responseType: ResponseType.json,
        ));
/*    _dio.options.headers['Accept'] = "application/json";
    _dio.options.headers['content-Type'] = "application/x-www-form-urlencoded";
    var response = await _dio.post ('/Token');*/
    //    body: jsonMap,
        //encoding: Encoding.getByName("utf-8");
    if (response.statusCode == 200) {
      var loginResponse = loginResponseFromJson("str");
      if (loginResponse != null) {
        return [loginResponse.accessToken,loginResponse.id, "user Logged IN"];
      } else {
        return ["", "Unknown Error"];
      }
    } else {
      var json = response.data;
      var errorResp = errorRespFromJson(json);
      if (errorResp == null) {
        return ["", "Unknown Error"];
      } else {
        return ["", errorResp.error];
      }
    }
  }
  //All Doctor APIS:
  JobListResponse? Job;
  List<Re> completeStatus=[];
  List<Re> JobList = [];
  static Future<List<Re>> fetchJobList(String bearer) async {
    SharedPreferences prefrences = await SharedPreferences.getInstance();
    token = prefrences.getString("token");
    userid = prefrences.getString("id");
    var response = await http.get(
      Uri.parse('$_baseURL/api/Doctor/GetDoctorSurgeryJobList?id=$userid'),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/x-www-form-urlencoded"
      },);
    if (response.statusCode == 200) {
      JobListResponse res = jobListResponseFromJson(response.body);
      var JobList = res.data!.toList();
      return JobList;
    } else {
      throw Exception('Failed to load internet');
    }
  }
  //Doctor Profile Information
  ProfileListResponse? Profile;
  static Future<void> fetchProfileList(String bearer) async {
    SharedPreferences prefrences= await SharedPreferences.getInstance();
    token = prefrences.getString("token");
    userid = prefrences.getString("id");
    var response = await http.get(Uri.parse('$_baseURL/api/Doctor/GetDoctorProfile?id=$userid'),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/x-www-form-urlencoded"
      },);
    if (response.statusCode == 200) {
      ProfileListResponse res = profileListResponseFromJson(response.body);
      profilecontroller.ProfileList.value =  res.data!.doctorProfileInfomation!;
    } else {
      throw Exception('Failed to load internet');
    }

  }
  ProfileListResponse? Documnet;
  List<DoctorDocument>? doctorDocumentList = [];

  static Future <List<DoctorDocument>> fetchDocumnetList(String bearer) async {
    SharedPreferences prefrences= await SharedPreferences.getInstance();
    token = prefrences.getString("token");
    userid = prefrences.getString("id");
    var response = await http.get(Uri.parse('$_baseURL/api/Doctor/GetDoctorProfile?id=$userid'),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/x-www-form-urlencoded"
      },);
    if (response.statusCode == 200) {
      ProfileListResponse res = profileListResponseFromJson(response.body);
      var doctorDocumentList = res.data!.doctorDocuments!.toList();
      return doctorDocumentList;
    } else {
      throw Exception('Failed to load internet');
    }

  }
//Doctor Prefrence List
  ProfileListResponse? Prefrence;
  List<DoctorPreference>? doctorPrefrenceList = [];

  static Future <List<DoctorPreference>> fetchPrefrenceList(String bearer) async {
    SharedPreferences prefrences= await SharedPreferences.getInstance();
    token = prefrences.getString("token");
    userid = prefrences.getString("id");
    var response = await http.get(Uri.parse('$_baseURL/api/Doctor/GetDoctorProfile?id=$userid'),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/x-www-form-urlencoded"
      },);
    if (response.statusCode == 200) {
      ProfileListResponse res = profileListResponseFromJson(response.body);
      var doctorPrefrenceList = res.data!.doctorPreference!.toList();
      return doctorPrefrenceList;
    } else {
      throw Exception('Failed to load internet');
    }

  }

  //AMS Driver APIS
/*  static Future<LoginResponse?> Driverlogin({required LoginResponse userInfo}) async {
    LoginResponse? retrievedUser;
    try {
      _dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';
      var response = await _dio.post(
        '/Token',
       // data: userInfo.toJson(),
      );

      print('User created: ${response.data}');

      retrievedUser = LoginResponse.fromJson(response.data);
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrievedUser;
  }*/
  static Future<List> Driverlogin({String? name, String? password, String? grant_type}) async {
    Map<String, dynamic> jsonMap = {
      "username":"ArslanTestdriver",
      "password":"123456",
      "grant_type": "password",
    };
    var response = await client.post (Uri.parse('$_baseURL/Token'),
        body: jsonMap,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        encoding: Encoding.getByName("utf-8"));
    if (response.statusCode == 200) {
      var json = response.body;
      var loginResponse = loginResponseFromJson(json);
      if (loginResponse != null) {
        return [loginResponse.accessToken,loginResponse.id, "user Logged IN"];
      } else {
        return ["", "Unknown Error"];
      }
    } else {
      var json = response.body;
      var errorResp = errorRespFromJson(json);
      if (errorResp == null) {
        return ["", "Unknown Error"];
      } else {
        return ["", errorResp.error];
      }
    }
  }

  // Driver All API'S
  DriverJobListResponse? DriverJob;
  List<DriverRe> DriverJobList = [];
   static Future<List<DriverRe>> fetchDriverJobList(String bearer) async {
    SharedPreferences prefrences = await SharedPreferences.getInstance();
    token = prefrences.getString("token");
    userid = prefrences.getString("id");
    var response = await http.get(
      Uri.parse('$_baseURL/GetDriverJobList?id=$userid'),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/x-www-form-urlencoded"
      },);
    if (response.statusCode == 200) {
      DriverJobListResponse res = driverJobListResponseFromJson(response.body);
      var DriverJobList = res.res!.toList();
      return DriverJobList;
    } else {
      throw Exception('Failed to load internet');
    }
  }

  //Driver Information List
  DriverProfileResponse? DriverProfile;
  static Future<void> fetchDriverProfile(String bearer) async {
    SharedPreferences prefrences = await SharedPreferences.getInstance();
    token = prefrences.getString("token");
    userid = prefrences.getString("id");
    var response = await http.get(
      Uri.parse('$_baseURL/GetDriverProfile?id=$userid'),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/x-www-form-urlencoded"
      },);
    if (response.statusCode == 200) {
      DriverProfileResponse res = driverProfileResponseFromJson(response.body);
      driverProfileController.DriverProfileInfo.value= res.res!.driverInfo!;
    } else {
      throw Exception('Failed to load internet');
    }
  }
  // Driver Car Info
  DriverProfileResponse? DriverCarInfo;
  static Future<void> fetchDriverCar(String bearer) async {
    SharedPreferences prefrences = await SharedPreferences.getInstance();
    token = prefrences.getString("token");
    userid = prefrences.getString("id");
    var response = await http.get(
      Uri.parse('$_baseURL/GetDriverProfile?id=$userid'),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/x-www-form-urlencoded"
      },);
    if (response.statusCode == 200) {
      DriverProfileResponse res = driverProfileResponseFromJson(response.body);
      driverProfileController.DriverCar.value= res.res!.driverCarInfo!;
    } else {
      throw Exception('Failed to load internet');
    }
  }

  //Driver All Information By Id's
 List<Ride> rideList = [];
  static Future<List<Ride>> fetchRideList(int DriverId , int SurgerId, double carlatitude,double carlongitude) async {
    SharedPreferences prefrences = await SharedPreferences.getInstance();
    token = prefrences.getString("token");
    var response = await http.get(
      Uri.parse('$_baseURL/GetRideInfosByIds?driverId= $DriverId &surgeryId= $SurgerId'),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/x-www-form-urlencoded"
      },);
    if (response.statusCode == 200) {
      DriverRideResponse res = driverRideResponseFromJson(response.body);
      var rideList = res.res!.toList();
      return rideList;
    } else {
      throw Exception('Failed to load internet');
    }
  }
  //CMS Login:

/*  Future<LoginResponse?> submitchildform(FormData formData) async {
    LoginResponse? retrievedUser;
    try {
      http.Response response = await http.post(Uri.parse('$_baseURLCMS/api/ComplaintsAPI/saveOfficerProceedings'),

          headers: {
            "Content-Type": "application/json"
          },
          encoding: Encoding.getByName("utf-8"));

      retrievedUser = LoginResponse.fromJson(response.body);
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrievedUser;
  }*/


 /* Future uploadmultipleimage(List images) async {
    var uri = Uri.parse("$_baseURLCMS/ComplaintsAPI/saveOfficerProceedings");
    http.MultipartRequest request = new http.MultipartRequest('POST', uri);
    request.headers['aspuserid'] = '';
    request.fields['user_id'] = '10';
    request.fields['post_details'] = 'dfsfdsfsd';
    multipartFile = new http.MultipartFile("imagefile", stream, length, filename: basename(imageFile.path));
*//*    List<MultipartFile> newList = new List<MultipartFile>();
    for (int i = 0; i < images.length; i++) {
      File imageFile = File(images[i].toString());
      var stream =
      new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      var length = await imageFile.length();
      var multipartFile = new http.MultipartFile("imagefile", stream, length,
          filename: basename(imageFile.path));
      newList.add(multipartFile);
    }*//*
    request.files.addAll(images);
    var response = await request.send();
    if (response.statusCode == 200) {
      print("Image Uploaded");
    } else {
      print("Upload Failed");
    }
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }*/
}

