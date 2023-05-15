// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? flag;
  String? status;

  LoginModel({
    this.flag,
    this.status,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        flag: json["Flag"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Flag": flag,
        "Status": status,
      };
}
