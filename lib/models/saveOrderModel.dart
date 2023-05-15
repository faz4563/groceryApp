// To parse this JSON data, do
//
//     final saveOrderModel = saveOrderModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

SaveOrderModel saveOrderModelFromJson(String str) =>
    SaveOrderModel.fromJson(json.decode(str));

String saveOrderModelToJson(SaveOrderModel data) => json.encode(data.toJson());

class SaveOrderModel {
  String? flag;
  String? status;
  Data? data;

  SaveOrderModel({
    this.flag,
    this.status,
    this.data,
  });

  factory SaveOrderModel.fromJson(Map<String, dynamic> json) => SaveOrderModel(
        flag: json["Flag"],
        status: json["Status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "Flag": flag,
        "Status": status,
        "data": data?.toJson(),
      };
}

class Data {
  String? prodCode;
  String? prodName;
  String? prodPrice;
  String? prodAmount;
  String? prodImg;

  Data({
    this.prodCode,
    this.prodName,
    this.prodPrice,
    this.prodAmount,
    this.prodImg,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        prodCode: json["prod_code"],
        prodName: json["prod_name"],
        prodPrice: json["prod_price"],
        prodAmount: json["prod_amount"],
        prodImg: json["prod_img"],
      );

  Map<String, dynamic> toJson() => {
        "prod_code": prodCode,
        "prod_name": prodName,
        "prod_price": prodPrice,
        "prod_amount": prodAmount,
        "prod_img": prodImg,
      };
}
