// To parse this JSON data, do
//
//     final jobListResponse = jobListResponseFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

JobListResponse jobListResponseFromJson(String str) => JobListResponse.fromJson(json.decode(str));

String jobListResponseToJson(JobListResponse data) => json.encode(data.toJson());

class JobListResponse {
  JobListResponse({
    this.data,
  });

  List<Re>? data;

  factory JobListResponse.fromJson(Map<String, dynamic> json) => JobListResponse(
    data: json["res"] == null ? null : List<Re>.from(json["res"].map((x) => Re.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "res": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Re {
  Re({
    this.id,
    this.patientMrn,
    this.patientName,
    this.swd,
    this.gender,
    this.cnic,
    this.phoneNumber,
    this.surgeryType,
    this.surgeryName,
    this.surgeonName,
    this.surgeryHospital,
    this.assignedDoctorId,
    this.surgeryDate,
    this.createdBy,
    this.createdDate,
    this.anaesthesiaRequired,
    this.healthFacility,
    this.driverId,
    this.driverName,
    this.driverPhoneNo,
    this.doctorId,
    this.doctorName,
    this.requestedBy,
    this.carModel,
    this.color,
    this.registrationNumber,
    this.surgeryCurrentStatus,
    this.anesthetistDoctorId,
    this.driverUserId,
    this.surgeryHfLat,
    this.surgeryHfLang,
    this.filePath,
    this.status,
    this.doctorPickupLatitude,
    this.doctorPickupLongitude,
    this.driverJobStatus,
  });

  int? id;
  String? patientMrn;
  String? patientName;
  String? swd;
  String? gender;
  String? cnic;
  String? phoneNumber;
  String? surgeryType;
  String? surgeryName;
  dynamic? surgeonName;
  String ?surgeryHospital;
  dynamic? assignedDoctorId;
  DateTime? surgeryDate;
  String? createdBy;
  DateTime? createdDate;
  String? anaesthesiaRequired;
  String? healthFacility;
  int? driverId;
  String? driverName;
  String? driverPhoneNo;
  int? doctorId;
  String? doctorName;
  String? requestedBy;
  String? carModel;
  String? color;
  String? registrationNumber;
  String? surgeryCurrentStatus;
  String? anesthetistDoctorId;
  String? driverUserId;
  double? surgeryHfLat;
  double? surgeryHfLang;
  String? filePath;
  bool? status;
  double? doctorPickupLatitude;
  double? doctorPickupLongitude;
  String? driverJobStatus;

  factory Re.fromJson(Map<String, dynamic> json) => Re(
    id: json["ID"] == null ? null : json["ID"],
    patientMrn: json["PatientMRN"] == null ? null : json["PatientMRN"],
    patientName: json["PatientName"] == null ? null : json["PatientName"],
    swd: json["SWD"] == null ? null : json["SWD"],
    gender: json["Gender"] == null ? null : json["Gender"],
    cnic: json["CNIC"] == null ? null : json["CNIC"],
    phoneNumber: json["PhoneNumber"] == null ? null : json["PhoneNumber"],
    surgeryType: json["SurgeryType"] == null ? null : json["SurgeryType"],
    surgeryName: json["SurgeryName"] == null ? null : json["SurgeryName"],
    surgeonName: json["SurgeonName"],
    surgeryHospital: json["SurgeryHospital"] == null ? null : json["SurgeryHospital"],
    assignedDoctorId: json["AssignedDoctorID"],
    surgeryDate: json["SurgeryDate"] == null ? null : DateTime.parse(json["SurgeryDate"]),
    createdBy: json["CreatedBy"] == null ? null : json["CreatedBy"],
    createdDate: json["CreatedDate"] == null ? null : DateTime.parse(json["CreatedDate"]),
    anaesthesiaRequired: json["AnaesthesiaRequired"] == null ? null : json["AnaesthesiaRequired"],
    healthFacility: json["HealthFacility"] == null ? null : json["HealthFacility"],
    driverId: json["DriverId"] == null ? null : json["DriverId"],
    driverName: json["DriverName"] == null ? null : json["DriverName"],
    driverPhoneNo: json["DriverPhoneNo"] == null ? null : json["DriverPhoneNo"],
    doctorId: json["DoctorId"] == null ? null : json["DoctorId"],
    doctorName: json["DoctorName"] == null ? null : json["DoctorName"],
    requestedBy: json["RequestedBy"] == null ? null : json["RequestedBy"],
    carModel: json["CarModel"] == null ? null : json["CarModel"],
    color: json["Color"] == null ? null : json["Color"],
    registrationNumber: json["RegistrationNumber"] == null ? null : json["RegistrationNumber"],
    surgeryCurrentStatus: json["surgeryCurrentStatus"] == null ? null : json["surgeryCurrentStatus"],
    anesthetistDoctorId: json["AnesthetistDoctorID"] == null ? null : json["AnesthetistDoctorID"],
    driverUserId: json["DriverUserID"] == null ? null : json["DriverUserID"],
    surgeryHfLat: json["SurgeryHFLat"] == null ? null : json["SurgeryHFLat"].toDouble(),
    surgeryHfLang: json["SurgeryHFLang"] == null ? null : json["SurgeryHFLang"].toDouble(),
    filePath: json["FilePath"] == null ? null : json["FilePath"],
    status: json["status"] == null ? null : json["status"],
    doctorPickupLatitude: json["DoctorPickupLatitude"] == null ? null : json["DoctorPickupLatitude"].toDouble(),
    doctorPickupLongitude: json["DoctorPickupLongitude"] == null ? null : json["DoctorPickupLongitude"].toDouble(),
    driverJobStatus: json["DriverJobStatus"] == null ? null : json["DriverJobStatus"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id == null ? null : id,
    "PatientMRN": patientMrn == null ? null : patientMrn,
    "PatientName": patientName == null ? null : patientName,
    "SWD": swd == null ? null : swd,
    "Gender": gender == null ? null : gender,
    "CNIC": cnic == null ? null : cnic,
    "PhoneNumber": phoneNumber == null ? null : phoneNumber,
    "SurgeryType": surgeryType == null ? null : surgeryType,
    "SurgeryName": surgeryName == null ? null : surgeryName,
    "SurgeonName": surgeonName,
    "SurgeryHospital": surgeryHospital == null ? null : surgeryHospital,
    "AssignedDoctorID": assignedDoctorId,
    "SurgeryDate": surgeryDate == null ? null : surgeryDate!.toIso8601String(),
    "CreatedBy": createdBy == null ? null : createdBy,
    "CreatedDate": createdDate == null ? null : createdDate!.toIso8601String(),
    "AnaesthesiaRequired": anaesthesiaRequired == null ? null : anaesthesiaRequired,
    "HealthFacility": healthFacility == null ? null : healthFacility,
    "DriverId": driverId == null ? null : driverId,
    "DriverName": driverName == null ? null : driverName,
    "DriverPhoneNo": driverPhoneNo == null ? null : driverPhoneNo,
    "DoctorId": doctorId == null ? null : doctorId,
    "DoctorName": doctorName == null ? null : doctorName,
    "RequestedBy": requestedBy == null ? null : requestedBy,
    "CarModel": carModel == null ? null : carModel,
    "Color": color == null ? null : color,
    "RegistrationNumber": registrationNumber == null ? null : registrationNumber,
    "surgeryCurrentStatus": surgeryCurrentStatus == null ? null : surgeryCurrentStatus,
    "AnesthetistDoctorID": anesthetistDoctorId == null ? null : anesthetistDoctorId,
    "DriverUserID": driverUserId == null ? null : driverUserId,
    "SurgeryHFLat": surgeryHfLat == null ? null : surgeryHfLat,
    "SurgeryHFLang": surgeryHfLang == null ? null : surgeryHfLang,
    "FilePath": filePath == null ? null : filePath,
    "status": status == null ? null : status,
    "DoctorPickupLatitude": doctorPickupLatitude == null ? null : doctorPickupLatitude,
    "DoctorPickupLongitude": doctorPickupLongitude == null ? null : doctorPickupLongitude,
    "DriverJobStatus": driverJobStatus == null ? null : driverJobStatus,
  };
}
