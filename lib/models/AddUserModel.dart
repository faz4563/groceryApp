// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  String? flag;
  String? status;

  RegisterModel({
    this.flag,
    this.status,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        flag: json["Flag"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Flag": flag,
        "Status": status,
      };
}
