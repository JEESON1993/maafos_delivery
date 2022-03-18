// To parse this JSON data, do
//
//     final analysisModel = analysisModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AnalysisModel analysisModelFromJson(String str) => AnalysisModel.fromJson(json.decode(str));

String analysisModelToJson(AnalysisModel data) => json.encode(data.toJson());

class AnalysisModel {
    AnalysisModel({
        @required this.success,
        @required this.data,
    });

    final bool success;
    final Data data;

    factory AnalysisModel.fromJson(Map<String, dynamic> json) => AnalysisModel(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "data": data == null ? null : data.toJson(),
    };
}

class Data {
    Data({
        @required this.id,
        @required this.orders,
        @required this.cash,
        @required this.online,
        @required this.ordersCount,
    });

    final String id;
    final List<Order> orders;
    final dynamic cash;
    final dynamic online;
    final dynamic ordersCount;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"] == null ? null : json["_id"],
        orders: json["orders"] == null ? null : List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
        cash: json["cash"] == null ? 0 : json["cash"].toDouble(),
        online: json["online"] == null ? 0 : json["online"].toDouble(),
        ordersCount: json["ordersCount"] == null ? null : json["ordersCount"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "orders": orders == null ? null : List<dynamic>.from(orders.map((x) => x.toJson())),
        "cash": cash == null ? null : cash,
        "online": online == null ? null : online,
        "ordersCount": ordersCount == null ? null : ordersCount,
    };
}

class Order {
    Order({
        @required this.id,
        @required this.orderNote,
        @required this.orderStatus,
        @required this.status,
        @required this.track,
        @required this.vendor,
        @required this.items,
        @required this.vendorType,
        @required this.paymentType,
        @required this.address,
        @required this.contactNumber,
        @required this.deliveryCharge,
        @required this.discount,
        @required this.paymentRazorpay,
        @required this.customer,
        @required this.subTotalAmount,
        @required this.deliveryTip,
        @required this.branch,
        @required this.totalAmount,
        @required this.vendorTotalAmount,
        @required this.vendorCommissionTotal,
        @required this.commissionDetail,
        @required this.deliveryDistanceKm,
        @required this.deliveryDistance,
        @required this.orderId,
        @required this.createdAt,
        @required this.updatedAt,
        @required this.v,
        @required this.deliveryBoy,
    });

    final String id;
    final List<dynamic> orderNote;
    final String orderStatus;
    final List<Status> status;
    final List<Track> track;
    final String vendor;
    final List<Item> items;
    final String vendorType;
    final String paymentType;
    final Address address;
    final String contactNumber;
    final double deliveryCharge;
    final dynamic discount;
    final PaymentRazorpay paymentRazorpay;
    final String customer;
    final dynamic subTotalAmount;
    final dynamic deliveryTip;
    final String branch;
    final double totalAmount;
    final dynamic vendorTotalAmount;
    final dynamic vendorCommissionTotal;
    final CommissionDetail commissionDetail;
    final double deliveryDistanceKm;
    final dynamic deliveryDistance;
    final String orderId;
    final String createdAt;
    final String updatedAt;
    final dynamic v;
    final String deliveryBoy;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["_id"] == null ? null : json["_id"],
        orderNote: json["orderNote"] == null ? null : List<dynamic>.from(json["orderNote"].map((x) => x)),
        orderStatus: json["orderStatus"] == null ? null : json["orderStatus"],
        status: json["status"] == null ? null : List<Status>.from(json["status"].map((x) => Status.fromJson(x))),
        track: json["track"] == null ? null : List<Track>.from(json["track"].map((x) => Track.fromJson(x))),
        vendor: json["vendor"] == null ? null : json["vendor"],
        items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        vendorType: json["vendorType"] == null ? null : json["vendorType"],
        paymentType: json["paymentType"] == null ? null : json["paymentType"],
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        contactNumber: json["contactNumber"] == null ? null : json["contactNumber"],
        deliveryCharge: json["deliveryCharge"] == null ? null : json["deliveryCharge"].toDouble(),
        discount: json["discount"] == null ? null : json["discount"],
        paymentRazorpay: json["paymentRazorpay"] == null ? null : PaymentRazorpay.fromJson(json["paymentRazorpay"]),
        customer: json["customer"] == null ? null : json["customer"],
        subTotalAmount: json["subTotalAmount"] == null ? null : json["subTotalAmount"],
        deliveryTip: json["deliveryTip"] == null ? null : json["deliveryTip"],
        branch: json["branch"] == null ? null : json["branch"],
        totalAmount: json["totalAmount"] == null ? null : json["totalAmount"].toDouble(),
        vendorTotalAmount: json["vendorTotalAmount"] == null ? null : json["vendorTotalAmount"],
        vendorCommissionTotal: json["vendorCommissionTotal"] == null ? null : json["vendorCommissionTotal"],
        commissionDetail: json["commissionDetail"] == null ? null : CommissionDetail.fromJson(json["commissionDetail"]),
        deliveryDistanceKm: json["deliveryDistanceKm"] == null ? null : json["deliveryDistanceKm"].toDouble(),
        deliveryDistance: json["deliveryDistance"] == null ? null : json["deliveryDistance"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        v: json["__v"] == null ? null : json["__v"],
        deliveryBoy: json["deliveryBoy"] == null ? null : json["deliveryBoy"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "orderNote": orderNote == null ? null : List<dynamic>.from(orderNote.map((x) => x)),
        "orderStatus": orderStatus == null ? null : orderStatus,
        "status": status == null ? null : List<dynamic>.from(status.map((x) => x.toJson())),
        "track": track == null ? null : List<dynamic>.from(track.map((x) => x.toJson())),
        "vendor": vendor == null ? null : vendor,
        "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
        "vendorType": vendorType == null ? null : vendorType,
        "paymentType": paymentType == null ? null : paymentType,
        "address": address == null ? null : address.toJson(),
        "contactNumber": contactNumber == null ? null : contactNumber,
        "deliveryCharge": deliveryCharge == null ? null : deliveryCharge,
        "discount": discount == null ? null : discount,
        "paymentRazorpay": paymentRazorpay == null ? null : paymentRazorpay.toJson(),
        "customer": customer == null ? null : customer,
        "subTotalAmount": subTotalAmount == null ? null : subTotalAmount,
        "deliveryTip": deliveryTip == null ? null : deliveryTip,
        "branch": branch == null ? null : branch,
        "totalAmount": totalAmount == null ? null : totalAmount,
        "vendorTotalAmount": vendorTotalAmount == null ? null : vendorTotalAmount,
        "vendorCommissionTotal": vendorCommissionTotal == null ? null : vendorCommissionTotal,
        "commissionDetail": commissionDetail == null ? null : commissionDetail.toJson(),
        "deliveryDistanceKm": deliveryDistanceKm == null ? null : deliveryDistanceKm,
        "deliveryDistance": deliveryDistance == null ? null : deliveryDistance,
        "orderId": orderId == null ? null : orderId,
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "__v": v == null ? null : v,
        "deliveryBoy": deliveryBoy == null ? null : deliveryBoy,
    };
}

class Address {
    Address({
        @required this.address,
        @required this.landmark,
        @required this.coordinates,
        @required this.formattedAddress,
        @required this.addressType,
    });

    final String address;
    final dynamic landmark;
    final List<double> coordinates;
    final String formattedAddress;
    final dynamic addressType;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"] == null ? null : json["address"],
        landmark: json["landmark"],
        coordinates: json["coordinates"] == null ? null : List<double>.from(json["coordinates"].map((x) => x.toDouble())),
        formattedAddress: json["formattedAddress"] == null ? null : json["formattedAddress"],
        addressType: json["addressType"],
    );

    Map<String, dynamic> toJson() => {
        "address": address == null ? null : address,
        "landmark": landmark,
        "coordinates": coordinates == null ? null : List<dynamic>.from(coordinates.map((x) => x)),
        "formattedAddress": formattedAddress == null ? null : formattedAddress,
        "addressType": addressType,
    };
}

class CommissionDetail {
    CommissionDetail({
        @required this.type,
        @required this.commission,
        @required this.commissionAmount,
    });

    final String type;
    final dynamic commission;
    final dynamic commissionAmount;

    factory CommissionDetail.fromJson(Map<String, dynamic> json) => CommissionDetail(
        type: json["type"] == null ? null : json["type"],
        commission: json["commission"] == null ? null : json["commission"],
        commissionAmount: json["commissionAmount"] == null ? null : json["commissionAmount"],
    );

    Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "commission": commission == null ? null : commission,
        "commissionAmount": commissionAmount == null ? null : commissionAmount,
    };
}

class Item {
    Item({
        @required this.id,
        @required this.name,
        @required this.maafosPrice,
        @required this.price,
        @required this.offerPrice,
        @required this.packingCharge,
        @required this.qty,
    });

    final String id;
    final String name;
    final dynamic maafosPrice;
    final dynamic price;
    final dynamic offerPrice;
    final dynamic packingCharge;
    final dynamic qty;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        maafosPrice: json["maafosPrice"] == null ? null : json["maafosPrice"],
        price: json["price"] == null ? null : json["price"],
        offerPrice: json["offerPrice"] == null ? null : json["offerPrice"],
        packingCharge: json["packingCharge"] == null ? null : json["packingCharge"],
        qty: json["qty"] == null ? null : json["qty"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "maafosPrice": maafosPrice == null ? null : maafosPrice,
        "price": price == null ? null : price,
        "offerPrice": offerPrice == null ? null : offerPrice,
        "packingCharge": packingCharge == null ? null : packingCharge,
        "qty": qty == null ? null : qty,
    };
}

class PaymentRazorpay {
    PaymentRazorpay({
        @required this.orderId,
        @required this.paymentId,
        @required this.signature,
    });

    final String orderId;
    final String paymentId;
    final String signature;

    factory PaymentRazorpay.fromJson(Map<String, dynamic> json) => PaymentRazorpay(
        orderId: json["orderId"] == null ? null : json["orderId"],
        paymentId: json["paymentId"] == null ? null : json["paymentId"],
        signature: json["signature"] == null ? null : json["signature"],
    );

    Map<String, dynamic> toJson() => {
        "orderId": orderId == null ? null : orderId,
        "paymentId": paymentId == null ? null : paymentId,
        "signature": signature == null ? null : signature,
    };
}

class Status {
    Status({
        @required this.info,
        @required this.updated,
        @required this.updatedBy,
    });

    final String info;
    final String updated;
    final String updatedBy;

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        info: json["info"] == null ? null : json["info"],
        updated: json["updated"] == null ? null : json["updated"],
        updatedBy: json["updatedBy"] == null ? null : json["updatedBy"],
    );

    Map<String, dynamic> toJson() => {
        "info": info == null ? null : info,
        "updated": updated == null ? null : updated,
        "updatedBy": updatedBy == null ? null : updatedBy,
    };
}

class Track {
    Track({
        @required this.info,
        @required this.code,
        @required this.detail,
        @required this.asset,
        @required this.status,
        @required this.updated,
    });

    final String info;
    final String code;
    final String detail;
    final String asset;
    final bool status;
    final String updated;

    factory Track.fromJson(Map<String, dynamic> json) => Track(
        info: json["info"] == null ? null : json["info"],
        code: json["code"] == null ? null : json["code"],
        detail: json["detail"] == null ? null : json["detail"],
        asset: json["asset"] == null ? null : json["asset"],
        status: json["status"] == null ? null : json["status"],
        updated: json["updated"] == null ? null : json["updated"],
    );

    Map<String, dynamic> toJson() => {
        "info": info == null ? null : info,
        "code": code == null ? null : code,
        "detail": detail == null ? null : detail,
        "asset": asset == null ? null : asset,
        "status": status == null ? null : status,
        "updated": updated == null ? null : updated,
    };
}
