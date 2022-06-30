// ignore_for_file: file_names, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, prefer_const_constructors
import 'package:ams_flutter/Controller/DoctorProfileController.dart';
import 'package:ams_flutter/ResponseClass/ProfileResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ProfilePage extends StatefulWidget {
  final Widget? child;
  final String? title;
  const ProfilePage({Key? key, this.child, this.title}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   Future<void>? _launched;
  String _phone = '';
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();

  bool loaded = false;
  String _filePath = '';
  final controller = ScrollController();
  final completeProfilecontroller = Get.put(ProfileController());

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Profile", textAlign: TextAlign.center,),
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(height: 10.0,),
            PrefrenceInformation(),
            SizedBox(height: 10.0,),
            DocumentInformation(),
            SizedBox(height: 10.0,),
            ProfileInformation(),
          ],
        ),
      )
    );
  }
  Widget ProfileInformation() {
    return Container(
        child:Card(
            color: Colors.purple,
            child:Column(
              children: [
                Text("Doctor Profile",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                Card(
                    color: Colors.purple,
                    child:  Obx((){
                      if (completeProfilecontroller.isLoading.value)
                        return Center(child: CircularProgressIndicator());
                      else
                        return Container(
                          child:Card(
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("Doctor Name:", style: TextStyle(fontWeight: FontWeight.bold),),
                                      SizedBox(width: 5.0,),
                                      Flexible(child: Text(completeProfilecontroller.ProfileList.value.fullName.toString(),))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("S/W/D Name:", style: TextStyle(fontWeight: FontWeight.bold),),
                                      SizedBox(width: 5.0,),
                                      Flexible(child: Text(completeProfilecontroller.ProfileList.value.swd.toString(),))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Doctor CNIC:", style: TextStyle(fontWeight: FontWeight.bold),),
                                      SizedBox(width: 5.0,),
                                      Flexible(child: Text(completeProfilecontroller.ProfileList.value.cnic.toString(),))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Gender: ", style: TextStyle(fontWeight: FontWeight.bold),),
                                      SizedBox(width: 5.0,),
                                      Flexible(child: Text(completeProfilecontroller.ProfileList.value.gender.toString(),))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("MobileNumber: ", style: TextStyle(fontWeight: FontWeight.bold),),
                                      SizedBox(width: 5.0,),
                                      Flexible(child: Text(completeProfilecontroller.ProfileList.value.mobileNumber.toString(),))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("EmailAddress: ", style: TextStyle(fontWeight: FontWeight.bold),),
                                      SizedBox(width: 5.0,),
                                      Flexible(child: Text(completeProfilecontroller.ProfileList.value.emailAddress.toString(),))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Domicile: ", style: TextStyle(fontWeight: FontWeight.bold),),
                                      SizedBox(width: 5.0,),
                                      Flexible(child: Text(completeProfilecontroller.ProfileList.value.domicile.toString(),))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Residential Address: ", style: TextStyle(fontWeight: FontWeight.bold),),
                                      SizedBox(width: 5.0,),
                                      Flexible(child: Text(completeProfilecontroller.ProfileList.value.residentialAddress.toString(),))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Work Address: ", style: TextStyle(fontWeight: FontWeight.bold),),
                                      SizedBox(width: 5.0,),
                                      Flexible(child: Text(completeProfilecontroller.ProfileList.value.workAddress.toString(),))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Experience-In-Years: ", style: TextStyle(fontWeight: FontWeight.bold),),
                                      SizedBox(width: 5.0,),
                                      Flexible(child: Text(completeProfilecontroller.ProfileList.value.experienceInYears.toString()+ " " + "years"))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Current-Service-Type: ", style: TextStyle(fontWeight: FontWeight.bold),),
                                      SizedBox(width: 5.0,),
                                      Flexible(child: Text(completeProfilecontroller.ProfileList.value.currentServiceType.toString()))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("DOB: ", style: TextStyle(fontWeight: FontWeight.bold),),
                                      SizedBox(width: 5.0,),
                                      Flexible(child: Text(completeProfilecontroller.ProfileList.value.dob.toString()))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("VerifyStatus: ", style: TextStyle(fontWeight: FontWeight.bold),),
                                      SizedBox(width: 5.0,),
                                      Flexible(child: Text(completeProfilecontroller.ProfileList.value.verifyStatus.toString()))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Residence District Code: ", style: TextStyle(fontWeight: FontWeight.bold),),
                                      SizedBox(width: 5.0,),
                                      Flexible(child: Text(completeProfilecontroller.ProfileList.value.residenceDistrictCode.toString()))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Residence Tehsil Code: ", style: TextStyle(fontWeight: FontWeight.bold),),
                                      SizedBox(width: 5.0,),
                                      Flexible(child: Text(completeProfilecontroller.ProfileList.value.residenceTehsilCode.toString()))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        );
                    })
                )
              ],
            )
        )
    );
  }
  Widget DocumentInformation(){
    return Container(
      child:Card(
        color: Colors.purple,
        child:Column(
          children: [
          Text("Doctor Document",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            Card(
                color: Colors.purple,
                child:  Obx((){
                  if (completeProfilecontroller.isLoading.value)
                    return Center(child: CircularProgressIndicator());
                  else
                    return ListView.builder(
                        controller: controller,
                        shrinkWrap: true,
                        itemCount: completeProfilecontroller.DocumnetList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return completeDocument(index, completeProfilecontroller.DocumnetList);
                        }
                    );
                })
            )
          ],
        )
      )
    );
  }

  Widget PrefrenceInformation(){
    return Container(
      child:Card(
        color: Colors.purple,
        child: Column(
          children: [
            Text("Doctor Prefrence",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            Card(
              color: Colors.purple,
              child:    Obx((){
                if (completeProfilecontroller.isLoading.value)
                  return Center(child: CircularProgressIndicator());
                else
                  return ListView.builder(
                      controller: controller,
                      shrinkWrap: true,
                      itemCount: completeProfilecontroller.PrefrenceList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return completeprefrence(index, completeProfilecontroller.PrefrenceList);
                      }
                  );
              }),
            )
          ],
        ),
      )
    );
  }
  // Show Prefrence List;
  Widget completeprefrence(int indx, List<DoctorPreference> documentList) {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),

        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      "District Name: ",
                      style: TextStyle(fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5.0,),
                    Flexible(child: Text(
                      completeProfilecontroller.PrefrenceList[indx].districtName.toString(),
                    ))
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  //Show Document List;
  Widget completeDocument(int indx, List<DoctorDocument> documentList) {
    return GestureDetector(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

                child: Container(
                  child: Column(
                    textDirection: TextDirection.ltr,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            "Document Name: ",
                            style: TextStyle(fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5.0,),
                          Flexible(child: Text(completeProfilecontroller.DocumnetList[indx].documentName.toString()))
                        ],
                      ),
                         SizedBox(height: 5.0,),
                         Row(
                          children: [
                            Text(
                              "Document Type: ",
                              style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5.0,),
                            Flexible(
                                child:InkWell(
                                  onTap: () {
                                   _launched = _launchInBrowser('https://drive.google.com/viewerng/viewer?embedded=true&url=${
                                       completeProfilecontroller.DocumnetList[indx].filePath}');
                                  },
                                  child: Ink.image(
                                    image: AssetImage('assets/document.png'),
                                    fit: BoxFit.cover,
                                    width: 30,
                                    height: 30,
                                  ),
                                )
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
   Future<void> _launchInBrowser(String url) async {
     if (await canLaunch(url)) {
       await launch(url, forceSafariVC: false, forceWebView: false);
     } else {
       throw 'Could not launch $url';
     }
   }


}
