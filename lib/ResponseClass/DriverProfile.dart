// To parse this JSON data, do
//
//     final driverProfileResponse = driverProfileResponseFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

DriverProfileResponse driverProfileResponseFromJson(String str) => DriverProfileResponse.fromJson(json.decode(str));

String driverProfileResponseToJson(DriverProfileResponse data) => json.encode(data.toJson());

class DriverProfileResponse {
  DriverProfileResponse({
    this.res,
  });

  DriverRes? res;

  factory DriverProfileResponse.fromJson(Map<String, dynamic> json) => DriverProfileResponse(
    res: json["res"] == null ? null : DriverRes.fromJson(json["res"]),
  );

  Map<String, dynamic> toJson() => {
    "res": res == null ? null : res!.toJson(),
  };
}

class DriverRes {
  DriverRes({
    this.driverInfo,
    this.driverCarInfo,
  });

  DriverInfo? driverInfo;
  DriverCarInfo? driverCarInfo;

  factory DriverRes.fromJson(Map<String, dynamic> json) => DriverRes(
    driverInfo: json["DriverInfo"] == null ? null : DriverInfo.fromJson(json["DriverInfo"]),
    driverCarInfo: json["DriverCarInfo"] == null ? null : DriverCarInfo.fromJson(json["DriverCarInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "DriverInfo": driverInfo == null ? null : driverInfo!.toJson(),
    "DriverCarInfo": driverCarInfo == null ? null : driverCarInfo!.toJson(),
  };
}

class DriverCarInfo {
  DriverCarInfo({
    this.id,
    this.registrationNumber,
    this.carMaker,
    this.carModel,
    this.yearOfMake,
    this.companyName,
    this.districtOperation,
    this.color,
    this.carId,
    this.parkingStation,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
  });

  int? id;
  String? registrationNumber;
  String? carMaker;
  String? carModel;
  dynamic? yearOfMake;
  dynamic? companyName;
  String? districtOperation;
  String? color;
  dynamic? carId;
  dynamic? parkingStation;
  dynamic? createdBy;
  dynamic? createdDate;
  dynamic? updatedBy;
  dynamic? updatedDate;

  factory DriverCarInfo.fromJson(Map<String, dynamic> json) => DriverCarInfo(
    id: json["Id"] == null ? null : json["Id"],
    registrationNumber: json["RegistrationNumber"] == null ? null : json["RegistrationNumber"],
    carMaker: json["CarMaker"] == null ? null : json["CarMaker"],
    carModel: json["CarModel"] == null ? null : json["CarModel"],
    yearOfMake: json["YearOfMake"],
    companyName: json["CompanyName"],
    districtOperation: json["DistrictOperation"] == null ? null : json["DistrictOperation"],
    color: json["Color"] == null ? null : json["Color"],
    carId: json["Car_ID"],
    parkingStation: json["ParkingStation"],
    createdBy: json["CreatedBy"],
    createdDate: json["CreatedDate"],
    updatedBy: json["UpdatedBy"],
    updatedDate: json["UpdatedDate"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id == null ? null : id,
    "RegistrationNumber": registrationNumber == null ? null : registrationNumber,
    "CarMaker": carMaker == null ? null : carMaker,
    "CarModel": carModel == null ? null : carModel,
    "YearOfMake": yearOfMake,
    "CompanyName": companyName,
    "DistrictOperation": districtOperation == null ? null : districtOperation,
    "Color": color == null ? null : color,
    "Car_ID": carId,
    "ParkingStation": parkingStation,
    "CreatedBy": createdBy,
    "CreatedDate": createdDate,
    "UpdatedBy": updatedBy,
    "UpdatedDate": updatedDate,
  };
}

class DriverInfo {
  DriverInfo({
    this.id,
    this.driverName,
    this.cnic,
    this.emailAddress,
    this.phoneNumber,
    this.address,
    this.shiftingTime,
    this.isAvailable,
    this.status,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.discode,
    this.companyId,
    this.companyName,
  });

  int? id;
  String? driverName;
  String? cnic;
  String? emailAddress;
  String? phoneNumber;
  dynamic? address;
  String? shiftingTime;
  bool? isAvailable;
  dynamic? status;
  dynamic? createdBy;
  DateTime? createdDate;
  dynamic? updatedBy;
  dynamic? updatedDate;
  dynamic? discode;
  dynamic? companyId;
  String?  companyName;

  factory DriverInfo.fromJson(Map<String, dynamic> json) => DriverInfo(
    id: json["Id"] == null ? null : json["Id"],
    driverName: json["DriverName"] == null ? null : json["DriverName"],
    cnic: json["CNIC"] == null ? null : json["CNIC"],
    emailAddress: json["EmailAddress"] == null ? null : json["EmailAddress"],
    phoneNumber: json["PhoneNumber"] == null ? null : json["PhoneNumber"],
    address: json["Address"],
    shiftingTime: json["ShiftingTime"] == null ? null : json["ShiftingTime"],
    isAvailable: json["IsAvailable"] == null ? null : json["IsAvailable"],
    status: json["Status"],
    createdBy: json["CreatedBy"],
    createdDate: json["CreatedDate"] == null ? null : DateTime.parse(json["CreatedDate"]),
    updatedBy: json["UpdatedBy"],
    updatedDate: json["UpdatedDate"],
    discode: json["Discode"],
    companyId: json["CompanyId"],
    companyName: json["CompanyName"] == null ? null : json["CompanyName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id == null ? null : id,
    "DriverName": driverName == null ? null : driverName,
    "CNIC": cnic == null ? null : cnic,
    "EmailAddress": emailAddress == null ? null : emailAddress,
    "PhoneNumber": phoneNumber == null ? null : phoneNumber,
    "Address": address,
    "ShiftingTime": shiftingTime == null ? null : shiftingTime,
    "IsAvailable": isAvailable == null ? null : isAvailable,
    "Status": status,
    "CreatedBy": createdBy,
    "CreatedDate": createdDate == null ? null : createdDate!.toIso8601String(),
    "UpdatedBy": updatedBy,
    "UpdatedDate": updatedDate,
    "Discode": discode,
    "CompanyId": companyId,
    "CompanyName": companyName == null ? null : companyName,
  };
}
