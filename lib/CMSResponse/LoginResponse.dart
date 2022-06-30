// ignore_for_file: file_names

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());
class LoginResponse {
  LoginResponse({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.userName,
    this.id,
    this.healthFacility,
    this.hfCode,
    this.role,
    this.issued,
    this.expires,
  });

  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? userName;
  String? id;
  String? healthFacility;
  String? hfCode;
  String? role;
  String? issued;
  String? expires;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
    userName: json["UserName"],
    id: json["Id"],
    healthFacility: json["Health Facility"],
    hfCode: json["HFCode"],
    role: json["role"],
    issued: json[".issued"],
    expires: json[".expires"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
    "UserName": userName,
    "Id": id,
    "Health Facility": healthFacility,
    "HFCode": hfCode,
    "role": role,
    ".issued": issued,
    ".expires": expires,
  };
}
