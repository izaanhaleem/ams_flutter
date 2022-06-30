// ignore_for_file: file_names, unnecessary_new, prefer_const_constructors

import 'package:ams_flutter/ResponseClass/ProfileResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final controller = ScrollController();
  static String? token;
  static String? userid;
  static var client = http.Client();
  static var _baseURL = "https://ams.pshealthpunjab.gov.pk";
  ProfileListResponse? Profile;
  List<DoctorProfileInfomation>? doctorProfileList = [];
  static Future <Map<String,dynamic>> fetchProfileList(String bearer) async {
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
      var doctorProfileList = res.data!.doctorProfileInfomation!.toJson();
      return doctorProfileList;
    } else {
      throw Exception('Failed to load internet');
    }

  }

  @override
  void initState() {
    super.initState();
    fetchProfileList("bearer");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Profile List"),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 0.9,
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisExtent: 150),
          controller: controller,
          shrinkWrap: true,
          itemCount: doctorProfileList!.length,
          itemBuilder: (BuildContext context, int index) {
            return buildNumber(index, doctorProfileList!);
          }),
    );
  }
  Widget buildNumber(int indx, List<DoctorProfileInfomation> completeStatus) {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),

        child: Container(
          child: Column(
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "Doctor Name: " + doctorProfileList![indx].fullName.toString(),
                style: TextStyle(fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Surgeon Name: " + doctorProfileList![indx].fullName.toString(),
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Text(
                "Driver Name: " + doctorProfileList![indx].fullName.toString(),
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
