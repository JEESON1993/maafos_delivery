// To parse this JSON data, do
//
//     final paymentModel = paymentModelFromJson(jsonString);

import 'dart:convert';

PaymentModel paymentModelFromJson(String str) =>
    PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());

class PaymentModel {
  PaymentModel({
    this.payment,
  });

  List<Payment> payment;

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        payment: json["payment"] == null
            ? null
            : List<Payment>.from(
                json["payment"].map((x) => Payment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "payment": payment == null
            ? null
            : List<dynamic>.from(payment.map((x) => x.toJson())),
      };
}

class Payment {
  Payment({
    this.processedBy,
    this.settledDates,
    this.settledList,
    this.status,
    this.id,
    this.type,
    this.deliveryBoy,
    this.restaurant,
    this.branch,
    this.totalBonus,
    this.totalEarning,
    this.totalCommission,
    this.totalAmount,
    this.payId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  ProcessedBy processedBy;
  List<DateTime> settledDates;
  List<String> settledList;
  String status;
  String id;
  String type;
  String deliveryBoy;
  String restaurant;
  String branch;
  dynamic totalBonus;
  dynamic totalEarning;
  dynamic totalCommission;
  dynamic totalAmount;
  String payId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic v;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        processedBy: json["processedBy"] == null
            ? null
            : ProcessedBy.fromJson(json["processedBy"]),
        settledDates: json["settledDates"] == null
            ? null
            : List<DateTime>.from(
                json["settledDates"].map((x) => DateTime.parse(x))),
        settledList: json["settledList"] == null
            ? null
            : List<String>.from(json["settledList"].map((x) => x)),
        status: json["status"] == null ? null : json["status"],
        id: json["_id"] == null ? null : json["_id"],
        type: json["type"] == null ? null : json["type"],
        deliveryBoy: json["deliveryBoy"] == null ? null : json["deliveryBoy"],
        restaurant: json["restaurant"] == null ? null : json["restaurant"],
        branch: json["branch"] == null ? null : json["branch"],
        totalBonus: json["totalBonus"] == null ? null : json["totalBonus"],
        totalEarning:
            json["totalEarning"] == null ? null : json["totalEarning"],
        totalCommission:
            json["totalCommission"] == null ? null : json["totalCommission"],
        totalAmount: json["totalAmount"] == null ? null : json["totalAmount"],
        payId: json["payId"] == null ? null : json["payId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "processedBy": processedBy == null ? null : processedBy.toJson(),
        "settledDates": settledDates == null
            ? null
            : List<dynamic>.from(settledDates.map((x) =>
                "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "settledList": settledList == null
            ? null
            : List<dynamic>.from(settledList.map((x) => x)),
        "status": status == null ? null : status,
        "_id": id == null ? null : id,
        "type": type == null ? null : type,
        "deliveryBoy": deliveryBoy == null ? null : deliveryBoy,
        "restaurant": restaurant == null ? null : restaurant,
        "branch": branch == null ? null : branch,
        "totalBonus": totalBonus == null ? null : totalBonus,
        "totalEarning": totalEarning == null ? null : totalEarning,
        "totalCommission": totalCommission == null ? null : totalCommission,
        "totalAmount": totalAmount == null ? null : totalAmount,
        "payId": payId == null ? null : payId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class ProcessedBy {
  ProcessedBy({
    this.role,
    this.id,
  });

  String role;
  String id;

  factory ProcessedBy.fromJson(Map<String, dynamic> json) => ProcessedBy(
        role: json["role"] == null ? null : json["role"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "role": role == null ? null : role,
        "id": id == null ? null : id,
      };
}
