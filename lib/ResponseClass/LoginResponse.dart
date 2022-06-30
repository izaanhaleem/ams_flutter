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
    this.password,
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
  String? password;
  String? id;
  String? healthFacility;
  String? hfCode;
  String? role;
  String? issued;
  String? expires;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    accessToken: json["access_token"] == null ? null : json["access_token"],
    tokenType: json["token_type"] == null ? null : json["token_type"],
    expiresIn: json["expires_in"] == null ? null : json["expires_in"],
    userName: json["UserName"] == null ? null : json["UserName"],
    password: json["password"] == null? null: json["password"],
    id: json["Id"] == null ? null : json["Id"],
    healthFacility: json["Health Facility"] == null ? null : json["Health Facility"],
    hfCode: json["HFCode"] == null ? null : json["HFCode"],
    role: json["role"] == null ? null : json["role"],
    issued: json[".issued"] == null ? null : json[".issued"],
    expires: json[".expires"] == null ? null : json[".expires"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken == null ? null : accessToken,
    "token_type": tokenType == null ? null : tokenType,
    "expires_in": expiresIn == null ? null : expiresIn,
    "UserName": userName == null ? null : userName,
    "Id": id == null ? null : id,
    "password": password == null? null : password,
    "Health Facility": healthFacility == null ? null : healthFacility,
    "HFCode": hfCode == null ? null : hfCode,
    "role": role == null ? null : role,
    ".issued": issued == null ? null : issued,
    ".expires": expires == null ? null : expires,
  };
}
