// ignore_for_file: file_names

import 'dart:convert';

DriverRideResponse driverRideResponseFromJson(String str) => DriverRideResponse.fromJson(json.decode(str));

String driverRideResponseToJson(DriverRideResponse data) => json.encode(data.toJson());

class DriverRideResponse {
  DriverRideResponse({
    this.res,
  });

  List<Ride>? res;

  factory DriverRideResponse.fromJson(Map<String, dynamic> json) => DriverRideResponse(
    res: json["res"] == null ? null : List<Ride>.from(json["res"].map((x) => Ride.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "res": res == null ? null : List<dynamic>.from(res!.map((x) => x.toJson())),
  };
}

class Ride {
  Ride({
    this.id,
    this.surgeryId,
    this.doctorId,
    this.driverId,
    this.latitude,
    this.longitude,
    this.createdBy,
    this.createdDate,
  });

  int? id;
  int? surgeryId;
  dynamic? doctorId;
  int? driverId;
  double? latitude;
  double? longitude;
  dynamic? createdBy;
  dynamic? createdDate;

  factory Ride.fromJson(Map<String, dynamic> json) => Ride(
    id: json["Id"] == null ? null : json["Id"],
    surgeryId: json["SurgeryId"] == null ? null : json["SurgeryId"],
    doctorId: json["DoctorId"],
    driverId: json["DriverId"] == null ? null : json["DriverId"],
    latitude: json["Latitude"] == null ? null : json["Latitude"].toDouble(),
    longitude: json["Longitude"] == null ? null : json["Longitude"].toDouble(),
    createdBy: json["CreatedBy"],
    createdDate: json["CreatedDate"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id == null ? null : id,
    "SurgeryId": surgeryId == null ? null : surgeryId,
    "DoctorId": doctorId,
    "DriverId": driverId == null ? null : driverId,
    "Latitude": latitude == null ? null : latitude,
    "Longitude": longitude == null ? null : longitude,
    "CreatedBy": createdBy,
    "CreatedDate": createdDate,
  };
}
