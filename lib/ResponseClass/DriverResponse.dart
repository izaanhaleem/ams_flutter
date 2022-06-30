// ignore_for_file: file_names

import 'dart:convert';

DriverJobListResponse driverJobListResponseFromJson(String str) => DriverJobListResponse.fromJson(json.decode(str));

String driverJobListResponseToJson(DriverJobListResponse data) => json.encode(data.toJson());

class DriverJobListResponse {
  DriverJobListResponse({
    this.res,
  });

  List<DriverRe>? res;

  factory DriverJobListResponse.fromJson(Map<String, dynamic> json) => DriverJobListResponse(
    res: json["res"] == null ? null : List<DriverRe>.from(json["res"].map((x) => DriverRe.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "res": res == null ? null : List<dynamic>.from(res!.map((x) => x.toJson())),
  };
}

class DriverRe {
  DriverRe({
    this.surgerId,
    this.doctorName,
    this.doctorPhoneNumber,
    this.doctorCnic,
    this.driverId,
    this.driverName,
    this.driverCnic,
    this.driverPhoneNumber,
    this.driverShiftingTime,
    this.registrationNumber,
    this.carMaker,
    this.carModel,
    this.yearOfMake,
    this.companyName,
    this.requestedBy,
    this.jobDate,
    this.destination,
    this.driverUserId,
    this.surgeryJobStatus,
    this.surgeryHfLat,
    this.surgeryHfLang,
    this.doctorPickupLatitude,
    this.doctorPickupLongitude,
  });

  int? surgerId;
  String? doctorName;
  String? doctorPhoneNumber;
  String? doctorCnic;
  int? driverId;
  String? driverName;
  String? driverCnic;
  String? driverPhoneNumber;
  String? driverShiftingTime;
  String? registrationNumber;
  String? carMaker;
  String? carModel;
  String? yearOfMake;
  String? companyName;
  String? requestedBy;
  DateTime? jobDate;
  String? destination;
  String? driverUserId;
  String? surgeryJobStatus;
  double? surgeryHfLat;
  double? surgeryHfLang;
  double? doctorPickupLatitude;
  double? doctorPickupLongitude;

  factory DriverRe.fromJson(Map<String, dynamic> json) => DriverRe(
    surgerId: json["SurgerID"] == null ? null : json["SurgerID"],
    doctorName: json["DoctorName"] == null ? null : json["DoctorName"],
    doctorPhoneNumber: json["DoctorPhoneNumber"] == null ? null : json["DoctorPhoneNumber"],
    doctorCnic: json["DoctorCNIC"] == null ? null : json["DoctorCNIC"],
    driverId: json["DriverID"] == null ? null : json["DriverID"],
    driverName: json["DriverName"] == null ? null : json["DriverName"],
    driverCnic: json["DriverCNIC"] == null ? null : json["DriverCNIC"],
    driverPhoneNumber: json["DriverPhoneNumber"] == null ? null : json["DriverPhoneNumber"],
    driverShiftingTime: json["DriverShiftingTime"] == null ? null : json["DriverShiftingTime"],
    registrationNumber: json["RegistrationNumber"] == null ? null : json["RegistrationNumber"],
    carMaker: json["CarMaker"] == null ? null : json["CarMaker"],
    carModel: json["CarModel"] == null ? null : json["CarModel"],
    yearOfMake: json["YearOfMake"] == null ? null : json["YearOfMake"],
    companyName: json["CompanyName"] == null ? null : json["CompanyName"],
    requestedBy: json["RequestedBy"] == null ? null : json["RequestedBy"],
    jobDate: json["JobDate"] == null ? null : DateTime.parse(json["JobDate"]),
    destination: json["Destination"] == null ? null : json["Destination"],
    driverUserId: json["DriverUserID"] == null ? null : json["DriverUserID"],
    surgeryJobStatus: json["SurgeryJobStatus"] == null ? null : json["SurgeryJobStatus"],
    surgeryHfLat: json["SurgeryHFLat"] == null ? null : json["SurgeryHFLat"].toDouble(),
    surgeryHfLang: json["SurgeryHFLang"] == null ? null : json["SurgeryHFLang"].toDouble(),
    doctorPickupLatitude: json["DoctorPickupLatitude"] == null ? null : json["DoctorPickupLatitude"].toDouble(),
    doctorPickupLongitude: json["DoctorPickupLongitude"] == null ? null : json["DoctorPickupLongitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "SurgerID": surgerId == null ? null : surgerId,
    "DoctorName": doctorName == null ? null : doctorName,
    "DoctorPhoneNumber": doctorPhoneNumber == null ? null : doctorPhoneNumber,
    "DoctorCNIC": doctorCnic == null ? null : doctorCnic,
    "DriverID": driverId == null ? null : driverId,
    "DriverName": driverName == null ? null : driverName,
    "DriverCNIC": driverCnic == null ? null : driverCnic,
    "DriverPhoneNumber": driverPhoneNumber == null ? null : driverPhoneNumber,
    "DriverShiftingTime": driverShiftingTime == null ? null : driverShiftingTime,
    "RegistrationNumber": registrationNumber == null ? null : registrationNumber,
    "CarMaker": carMaker == null ? null : carMaker,
    "CarModel": carModel == null ? null : carModel,
    "YearOfMake": yearOfMake == null ? null : yearOfMake,
    "CompanyName": companyName == null ? null : companyName,
    "RequestedBy": requestedBy == null ? null : requestedBy,
    "JobDate": jobDate == null ? null : jobDate!.toIso8601String(),
    "Destination": destination == null ? null : destination,
    "DriverUserID": driverUserId == null ? null : driverUserId,
    "SurgeryJobStatus": surgeryJobStatus == null ? null : surgeryJobStatus,
    "SurgeryHFLat": surgeryHfLat == null ? null : surgeryHfLat,
    "SurgeryHFLang": surgeryHfLang == null ? null : surgeryHfLang,
    "DoctorPickupLatitude": doctorPickupLatitude == null ? null : doctorPickupLatitude,
    "DoctorPickupLongitude": doctorPickupLongitude == null ? null : doctorPickupLongitude,
  };
}
