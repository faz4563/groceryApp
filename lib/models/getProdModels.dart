// To parse this JSON data, do
//
//     final getProdModel = getProdModelFromJson(jsonString);

import 'dart:convert';

GetProdModel getProdModelFromJson(String str) =>
    GetProdModel.fromJson(json.decode(str));

String getProdModelToJson(GetProdModel data) => json.encode(data.toJson());

class GetProdModel {
  String? flag;
  List<Status>? status;

  GetProdModel({
    this.flag,
    this.status,
  });

  factory GetProdModel.fromJson(Map<String, dynamic> json) => GetProdModel(
        flag: json["Flag"],
        status: json["Status"] == null
            ? []
            : List<Status>.from(json["Status"]!.map((x) => Status.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Flag": flag,
        "Status": status == null
            ? []
            : List<dynamic>.from(status!.map((x) => x.toJson())),
      };
}

class Status {
  Id? id;
  String? prodCode;
  String? prodName;
  String? prodPrice;
  String? prodAmount;
  String? prodExpiry;
  String? prodImg;

  Status({
    this.id,
    this.prodCode,
    this.prodName,
    this.prodPrice,
    this.prodAmount,
    this.prodExpiry,
    this.prodImg,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["_id"] == null ? null : Id.fromJson(json["_id"]),
        prodCode: json["prod_code"],
        prodName: json["prod_name"],
        prodPrice: json["prod_price"],
        prodAmount: json["prod_amount"],
        prodExpiry: json["prod_expiry"],
        prodImg: json["prod_img"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id?.toJson(),
        "prod_code": prodCode,
        "prod_name": prodName,
        "prod_price": prodPrice,
        "prod_amount": prodAmount,
        "prod_expiry": prodExpiry,
        "prod_img": prodImg,
      };
}

class Id {
  String? oid;

  Id({
    this.oid,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}
