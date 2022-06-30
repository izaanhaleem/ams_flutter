// ignore_for_file: file_names

import 'dart:convert';

ProfileListResponse profileListResponseFromJson(String str) => ProfileListResponse.fromJson(json.decode(str));

String profileListResponseToJson(ProfileListResponse data) => json.encode(data.toJson());
class ProfileListResponse {
  ProfileListResponse({
    this.data,
  });

  Res? data;

  factory ProfileListResponse.fromJson(Map<String, dynamic> json) => ProfileListResponse(
    data: json["res"] == null ? null : Res.fromJson(json["res"]),
  );

  Map<String, dynamic> toJson() => {
    "res": data == null ? null : data!.toJson(),
  };
}

class Res {
  Res({
    this.doctorDocuments,
    this.doctorPreference,
    this.doctorProfileInfomation,
  });

  List<DoctorDocument>? doctorDocuments;
  List<DoctorPreference>? doctorPreference;
  DoctorProfileInfomation? doctorProfileInfomation;

  factory Res.fromJson(Map<String, dynamic> json) =>
      Res(
        doctorDocuments: json["DoctorDocuments"] == null ? null : List<
            DoctorDocument>.from(
            json["DoctorDocuments"].map((x) => DoctorDocument.fromJson(x))),
        doctorPreference: json["DoctorPreference"] == null ? null : List<
            DoctorPreference>.from(
            json["DoctorPreference"].map((x) => DoctorPreference.fromJson(x))),
        doctorProfileInfomation: json["DoctorProfileInfomation"] == null
            ? null
            : DoctorProfileInfomation.fromJson(json["DoctorProfileInfomation"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "DoctorDocuments": doctorDocuments == null ? null : List<dynamic>.from(
            doctorDocuments!.map((x) => x.toJson())),
        "DoctorPreference": doctorPreference == null ? null : List<
            dynamic>.from(doctorPreference!.map((x) => x.toJson())),
        "DoctorProfileInfomation": doctorProfileInfomation == null
            ? null
            : doctorProfileInfomation!.toJson(),
      };
}
  class DoctorDocument {
  DoctorDocument({
  this.id,
  this.documentName,
  this.companyName,
  this.name,
  this.filePath,
  });

  int? id;
  String? documentName;
  dynamic? companyName;
  dynamic? name;
  String? filePath;

  factory DoctorDocument.fromJson(Map<String, dynamic> json) => DoctorDocument(
  id: json["id"] == null ? null : json["id"],
  documentName: json["DocumentName"] == null ? null : json["DocumentName"],
  companyName: json["CompanyName"],
  name: json["Name"],
  filePath: json["FilePath"] == null ? null : json["FilePath"],
  );

  Map<String, dynamic> toJson() => {
  "id": id == null ? null : id,
  "DocumentName": documentName,
  "CompanyName": companyName,
  "Name": name,
  "FilePath": filePath == null ? null : filePath,
  };
  }

  class DoctorPreference {
  DoctorPreference({
  this.districtCode,
  this.districtName,
  });

  String? districtCode;
  String? districtName;

  factory DoctorPreference.fromJson(Map<String, dynamic> json) => DoctorPreference(
  districtCode: json["DistrictCode"] == null ? null : json["DistrictCode"],
  districtName: json["DistrictName"] == null ? null : json["DistrictName"],
  );

  Map<String, dynamic> toJson() => {
  "DistrictCode": districtCode == null ? null : districtCode,
  "DistrictName": districtName == null ? null : districtName,
  };
  }

  class DoctorProfileInfomation {
  DoctorProfileInfomation({
  this.id,
  this.fullName,
  this.cnic,
  this.gender,
  this.mobileNumber,
  this.emailAddress,
  this.domicile,
  this.residentialAddress,
  this.workAddress,
  this.districtPreference,
  this.highestQualification,
  this.experienceInYears,
  this.currentServiceType,
  this.anesthetistuniqueId,
  this.anesthetistDoctorId,
  this.createdBy,
  this.createdDate,
  this.residenceHfmisCode,
  this.residenceDistrictCode,
  this.residenceTehsilCode,
  this.dob,
  this.verifyStatus,
  this.swd,
  this.rejectionRemarks,
  });

  int? id;
  String? fullName;
  String? cnic;
  String? gender;
  String? mobileNumber;
  String? emailAddress;
  String? domicile;
  String? residentialAddress;
  String? workAddress;
  dynamic? districtPreference;
  dynamic? highestQualification;
  String? experienceInYears;
  String? currentServiceType;
  dynamic? anesthetistuniqueId;
  dynamic? anesthetistDoctorId;
  dynamic? createdBy;
  DateTime? createdDate;
  String? residenceHfmisCode;
  String? residenceDistrictCode;
  String? residenceTehsilCode;
  DateTime? dob;
  String? verifyStatus;
  String? swd;
  String? rejectionRemarks;

  factory DoctorProfileInfomation.fromJson(Map<String, dynamic> json) => DoctorProfileInfomation(
  id: json["ID"] == null ? null : json["ID"],
  fullName: json["FullName"] == null ? null : json["FullName"],
  cnic: json["CNIC"] == null ? null : json["CNIC"],
  gender: json["Gender"] == null ? null : json["Gender"],
  mobileNumber: json["MobileNumber"] == null ? null : json["MobileNumber"],
  emailAddress: json["EmailAddress"] == null ? null : json["EmailAddress"],
  domicile: json["Domicile"] == null ? null : json["Domicile"],
  residentialAddress: json["ResidentialAddress"] == null ? null : json["ResidentialAddress"],
  workAddress: json["WorkAddress"] == null ? null : json["WorkAddress"],
  districtPreference: json["DistrictPreference"],
  highestQualification: json["HighestQualification"],
  experienceInYears: json["ExperienceInYears"] == null ? null : json["ExperienceInYears"],
  currentServiceType: json["CurrentServiceType"] == null ? null : json["CurrentServiceType"],
  anesthetistuniqueId: json["AnesthetistuniqueID"],
  anesthetistDoctorId: json["AnesthetistDoctorID"],
  createdBy: json["CreatedBy"],
  createdDate: json["CreatedDate"] == null ? null : DateTime.parse(json["CreatedDate"]),
  residenceHfmisCode: json["ResidenceHfmisCode"] == null ? null : json["ResidenceHfmisCode"],
  residenceDistrictCode: json["ResidenceDistrictCode"] == null ? null : json["ResidenceDistrictCode"],
  residenceTehsilCode: json["ResidenceTehsilCode"] == null ? null : json["ResidenceTehsilCode"],
  dob: json["DOB"] == null ? null : DateTime.parse(json["DOB"]),
  verifyStatus: json["VerifyStatus"] == null ? null : json["VerifyStatus"],
  swd: json["SWD"] == null ? null : json["SWD"],
  rejectionRemarks: json["RejectionRemarks"] == null ? null : json["RejectionRemarks"],
  );

  Map<String, dynamic> toJson() => {
  "ID": id == null ? null : id,
  "FullName": fullName == null ? null : fullName,
  "CNIC": cnic == null ? null : cnic,
  "Gender": gender == null ? null : gender,
  "MobileNumber": mobileNumber == null ? null : mobileNumber,
  "EmailAddress": emailAddress == null ? null : emailAddress,
  "Domicile": domicile == null ? null : domicile,
  "ResidentialAddress": residentialAddress == null ? null : residentialAddress,
  "WorkAddress": workAddress == null ? null : workAddress,
  "DistrictPreference": districtPreference,
  "HighestQualification": highestQualification,
  "ExperienceInYears": experienceInYears == null ? null : experienceInYears,
  "CurrentServiceType": currentServiceType == null ? null : currentServiceType,
  "AnesthetistuniqueID": anesthetistuniqueId,
  "AnesthetistDoctorID": anesthetistDoctorId,
  "CreatedBy": createdBy,
  "CreatedDate": createdDate == null ? null : createdDate!.toIso8601String(),
  "ResidenceHfmisCode": residenceHfmisCode == null ? null : residenceHfmisCode,
  "ResidenceDistrictCode": residenceDistrictCode == null ? null : residenceDistrictCode,
  "ResidenceTehsilCode": residenceTehsilCode == null ? null : residenceTehsilCode,
  "DOB": dob == null ? null : dob!.toIso8601String(),
  "VerifyStatus": verifyStatus == null ? null : verifyStatus,
  "SWD": swd == null ? null : swd,
  "RejectionRemarks": rejectionRemarks == null ? null : rejectionRemarks,
  };
  }
