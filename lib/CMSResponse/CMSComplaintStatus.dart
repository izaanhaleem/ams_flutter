// To parse this JSON data, do
//
//     final cmsStatus = cmsStatusFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

CmsStatus cmsStatusFromJson(String str) => CmsStatus.fromJson(json.decode(str));

String cmsStatusToJson(CmsStatus data) => json.encode(data.toJson());

class CmsStatus {
  CmsStatus({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory CmsStatus.fromJson(Map<String, dynamic> json) => CmsStatus(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
