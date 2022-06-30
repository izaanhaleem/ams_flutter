// To parse this JSON data, do
//
//     final cmsProfile = cmsProfileFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

CmsProfile cmsProfileFromJson(String str) => CmsProfile.fromJson(json.decode(str));

String cmsProfileToJson(CmsProfile data) => json.encode(data.toJson());

class CmsProfile {
  CmsProfile({
    this.status,
    this.message,
    this.profile,
  });

  bool? status;
  String? message;
  List<CMSProfile>? profile;

  factory CmsProfile.fromJson(Map<String, dynamic> json) => CmsProfile(
    status: json["status"],
    message: json["message"],
    profile: json["profile"] == null ? null : List<CMSProfile>.from(json["profile"].map((x) => CMSProfile.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "profile": profile == null ? null : List<dynamic>.from(profile!.map((x) => x.toJson())),
  };
}

class CMSProfile {
  CMSProfile({
    this.id,
    this.departId,
    this.district,
    this.tehsil,
    this.name,
    this.phoneNumber,
    this.post,
    this.cnic,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.isActive,
    this.isdeletedAt,
    this.deletedAt,
    this.deletedBy,
    this.aspuserid,
    this.depart,
  });

  int? id;
  int? departId;
  String? district;
  String? tehsil;
  String? name;
  String? phoneNumber;
  String? post;
  String? cnic;
  DateTime? createdAt;
  String? createdBy;
  dynamic updatedAt;
  dynamic updatedBy;
  bool? isActive;
  dynamic isdeletedAt;
  dynamic deletedAt;
  dynamic deletedBy;
  String? aspuserid;
  dynamic depart;

  factory CMSProfile.fromJson(Map<String, dynamic> json) => CMSProfile(
    id: json["id"],
    departId: json["departId"],
    district: json["district"],
    tehsil: json["tehsil"],
    name: json["name"],
    phoneNumber: json["phoneNumber"],
    post: json["post"],
    cnic: json["cnic"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    createdBy: json["createdBy"],
    updatedAt: json["updatedAt"],
    updatedBy: json["updatedBy"],
    isActive: json["isActive"],
    isdeletedAt: json["isdeletedAt"],
    deletedAt: json["deletedAt"],
    deletedBy: json["deletedBy"],
    aspuserid: json["aspuserid"],
    depart: json["depart"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "departId": departId,
    "district": district,
    "tehsil": tehsil,
    "name": name,
    "phoneNumber": phoneNumber,
    "post": post,
    "cnic": cnic,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "createdBy": createdBy,
    "updatedAt": updatedAt,
    "updatedBy": updatedBy,
    "isActive": isActive,
    "isdeletedAt": isdeletedAt,
    "deletedAt": deletedAt,
    "deletedBy": deletedBy,
    "aspuserid": aspuserid,
    "depart": depart,
  };
}
