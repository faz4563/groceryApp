// To parse this JSON data, do
//
//     final addProdModel = addProdModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

AddProdModel addProdModelFromJson(String str) =>
    AddProdModel.fromJson(json.decode(str));

String addProdModelToJson(AddProdModel data) => json.encode(data.toJson());

class AddProdModel {
  String? flag;
  String? status;

  AddProdModel({
    this.flag,
    this.status,
  });

  factory AddProdModel.fromJson(Map<String, dynamic> json) => AddProdModel(
        flag: json["Flag"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Flag": flag,
        "Status": status,
      };
}
