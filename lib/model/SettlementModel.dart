// To parse this JSON data, do
//
//     final settlementModel = settlementModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SettlementModel settlementModelFromJson(String str) => SettlementModel.fromJson(json.decode(str));

String settlementModelToJson(SettlementModel data) => json.encode(data.toJson());

class SettlementModel {
    SettlementModel({
        @required this.success,
        @required this.total,
        @required this.pagination,
        @required this.data,
    });

    final bool success;
    final dynamic total;
    final Pagination pagination;
    final List<Datum> data;

    factory SettlementModel.fromJson(Map<String, dynamic> json) => SettlementModel(
        success: json["success"] == null ? null : json["success"],
        total: json["total"] == null ? null : json["total"],
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "total": total == null ? null : total,
        "pagination": pagination == null ? null : pagination.toJson(),
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        @required this.settledBy,
        @required this.bonusList,
        @required this.status,
        @required this.id,
        @required this.type,
        @required this.deliveryBoy,
        @required this.cash,
        @required this.online,
        @required this.orders,
        @required this.deliveryBoyEarnings,
        @required this.branch,
        @required this.createdAt,
        @required this.settlId,
        @required this.v,
        @required this.payId,
    });

    final SettledBy settledBy;
    final List<dynamic> bonusList;
    final String status;
    final String id;
    final String type;
    final String deliveryBoy;
    final double cash;
    final dynamic online;
    final dynamic orders;
    final double deliveryBoyEarnings;
    final String branch;
    final String createdAt;
    final String settlId;
    final dynamic v;
    final String payId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        settledBy: json["settledBy"] == null ? null : SettledBy.fromJson(json["settledBy"]),
        bonusList: json["bonusList"] == null ? null : List<dynamic>.from(json["bonusList"].map((x) => x)),
        status: json["status"] == null ? null : json["status"],
        id: json["_id"] == null ? null : json["_id"],
        type: json["type"] == null ? null : json["type"],
        deliveryBoy: json["deliveryBoy"] == null ? null : json["deliveryBoy"],
        cash: json["cash"] == null ? null : json["cash"].toDouble(),
        online: json["online"] == null ? null : json["online"],
        orders: json["orders"] == null ? null : json["orders"],
        deliveryBoyEarnings: json["deliveryBoyEarnings"] == null ? null : json["deliveryBoyEarnings"].toDouble(),
        branch: json["branch"] == null ? null : json["branch"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        settlId: json["settlId"] == null ? null : json["settlId"],
        v: json["__v"] == null ? null : json["__v"],
        payId: json["payId"] == null ? null : json["payId"],
    );

    Map<String, dynamic> toJson() => {
        "settledBy": settledBy == null ? null : settledBy.toJson(),
        "bonusList": bonusList == null ? null : List<dynamic>.from(bonusList.map((x) => x)),
        "status": status == null ? null : status,
        "_id": id == null ? null : id,
        "type": type == null ? null : type,
        "deliveryBoy": deliveryBoy == null ? null : deliveryBoy,
        "cash": cash == null ? null : cash,
        "online": online == null ? null : online,
        "orders": orders == null ? null : orders,
        "deliveryBoyEarnings": deliveryBoyEarnings == null ? null : deliveryBoyEarnings,
        "branch": branch == null ? null : branch,
        "createdAt": createdAt == null ? null : createdAt,
        "settlId": settlId == null ? null : settlId,
        "__v": v == null ? null : v,
        "payId": payId == null ? null : payId,
    };
}

class SettledBy {
    SettledBy({
        @required this.role,
        @required this.id,
    });

    final String role;
    final String id;

    factory SettledBy.fromJson(Map<String, dynamic> json) => SettledBy(
        role: json["role"] == null ? null : json["role"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "role": role == null ? null : role,
        "id": id == null ? null : id,
    };
}

class Pagination {
    Pagination();

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    );

    Map<String, dynamic> toJson() => {
    };
}
