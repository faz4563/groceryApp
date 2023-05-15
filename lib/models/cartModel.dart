// To parse this JSON data, do
//
//     final getCartModel = getCartModelFromJson(jsonString);

import 'dart:convert';

GetCartModel getCartModelFromJson(String str) =>
    GetCartModel.fromJson(json.decode(str));

String getCartModelToJson(GetCartModel data) => json.encode(data.toJson());

class GetCartModel {
  String? flag;
  List<Status>? status;

  GetCartModel({
    this.flag,
    this.status,
  });

  factory GetCartModel.fromJson(Map<String, dynamic> json) => GetCartModel(
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
  String? prodImg;

  Status({
    this.id,
    this.prodCode,
    this.prodName,
    this.prodPrice,
    this.prodAmount,
    this.prodImg,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["_id"] == null ? null : Id.fromJson(json["_id"]),
        prodCode: json["prod_code"],
        prodName: json["prod_name"],
        prodPrice: json["prod_price"],
        prodAmount: json["prod_amount"],
        prodImg: json["prod_img"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id?.toJson(),
        "prod_code": prodCode,
        "prod_name": prodName,
        "prod_price": prodPrice,
        "prod_amount": prodAmount,
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
