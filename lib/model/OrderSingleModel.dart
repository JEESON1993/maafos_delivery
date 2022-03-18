// To parse this JSON data, do
//
//     final orderSingleModel = orderSingleModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OrderSingleModel orderSingleModelFromJson(String str) => OrderSingleModel.fromJson(json.decode(str));

String orderSingleModelToJson(OrderSingleModel data) => json.encode(data.toJson());

class OrderSingleModel {
    OrderSingleModel({
        @required this.success,
        @required this.data,
    });

    final bool success;
    final Data data;

    factory OrderSingleModel.fromJson(Map<String, dynamic> json) => OrderSingleModel(
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
        @required this.commissionDetail,
        @required this.orderNote,
        @required this.orderStatus,
        @required this.status,
        @required this.track,
        @required this.id,
        @required this.vendor,
        @required this.vendorType,
        @required this.items,
        @required this.contactNumber,
        @required this.deliveryCharge,
        @required this.discount,
        @required this.paymentType,
        @required this.address,
        @required this.customer,
        @required this.subTotalAmount,
        @required this.deliveryTip,
        @required this.branch,
        @required this.totalAmount,
        @required this.vendorTotalAmount,
        @required this.vendorCommissionTotal,
        @required this.deliveryDistanceKm,
        @required this.deliveryDistance,
        @required this.orderId,
        @required this.createdAt,
        @required this.updatedAt,
        @required this.v,
        @required this.deliveryBoy,
    });

    final CommissionDetail commissionDetail;
    final List<dynamic> orderNote;
    final String orderStatus;
    final List<Status> status;
    final List<Track> track;
    final String id;
    final Vendor vendor;
    final String vendorType;
    final List<Item> items;
    final String contactNumber;
    final dynamic deliveryCharge;
    final dynamic discount;
    final String paymentType;
    final Address address;
    final Customer customer;
    final dynamic subTotalAmount;
    final dynamic deliveryTip;
    final Branch branch;
    final dynamic totalAmount;
    final dynamic vendorTotalAmount;
    final dynamic vendorCommissionTotal;
    final double deliveryDistanceKm;
    final dynamic deliveryDistance;
    final String orderId;
    final String createdAt;
    final String updatedAt;
    final dynamic v;
    final String deliveryBoy;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        commissionDetail: json["commissionDetail"] == null ? null : CommissionDetail.fromJson(json["commissionDetail"]),
        orderNote: json["orderNote"] == null ? null : List<dynamic>.from(json["orderNote"].map((x) => x)),
        orderStatus: json["orderStatus"] == null ? null : json["orderStatus"],
        status: json["status"] == null ? null : List<Status>.from(json["status"].map((x) => Status.fromJson(x))),
        track: json["track"] == null ? null : List<Track>.from(json["track"].map((x) => Track.fromJson(x))),
        id: json["_id"] == null ? null : json["_id"],
        vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
        vendorType: json["vendorType"] == null ? null : json["vendorType"],
        items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        contactNumber: json["contactNumber"] == null ? null : json["contactNumber"],
        deliveryCharge: json["deliveryCharge"] == null ? null : json["deliveryCharge"],
        discount: json["discount"] == null ? null : json["discount"],
        paymentType: json["paymentType"] == null ? null : json["paymentType"],
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
        subTotalAmount: json["subTotalAmount"] == null ? null : json["subTotalAmount"],
        deliveryTip: json["deliveryTip"] == null ? null : json["deliveryTip"],
        branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
        totalAmount: json["totalAmount"] == null ? null : json["totalAmount"],
        vendorTotalAmount: json["vendorTotalAmount"] == null ? null : json["vendorTotalAmount"],
        vendorCommissionTotal: json["vendorCommissionTotal"] == null ? null : json["vendorCommissionTotal"],
        deliveryDistanceKm: json["deliveryDistanceKm"] == null ? null : json["deliveryDistanceKm"].toDouble(),
        deliveryDistance: json["deliveryDistance"] == null ? null : json["deliveryDistance"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        v: json["__v"] == null ? null : json["__v"],
        deliveryBoy: json["deliveryBoy"] == null ? null : json["deliveryBoy"],
    );

    Map<String, dynamic> toJson() => {
        "commissionDetail": commissionDetail == null ? null : commissionDetail.toJson(),
        "orderNote": orderNote == null ? null : List<dynamic>.from(orderNote.map((x) => x)),
        "orderStatus": orderStatus == null ? null : orderStatus,
        "status": status == null ? null : List<dynamic>.from(status.map((x) => x.toJson())),
        "track": track == null ? null : List<dynamic>.from(track.map((x) => x.toJson())),
        "_id": id == null ? null : id,
        "vendor": vendor == null ? null : vendor.toJson(),
        "vendorType": vendorType == null ? null : vendorType,
        "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
        "contactNumber": contactNumber == null ? null : contactNumber,
        "deliveryCharge": deliveryCharge == null ? null : deliveryCharge,
        "discount": discount == null ? null : discount,
        "paymentType": paymentType == null ? null : paymentType,
        "address": address == null ? null : address.toJson(),
        "customer": customer == null ? null : customer.toJson(),
        "subTotalAmount": subTotalAmount == null ? null : subTotalAmount,
        "deliveryTip": deliveryTip == null ? null : deliveryTip,
        "branch": branch == null ? null : branch.toJson(),
        "totalAmount": totalAmount == null ? null : totalAmount,
        "vendorTotalAmount": vendorTotalAmount == null ? null : vendorTotalAmount,
        "vendorCommissionTotal": vendorCommissionTotal == null ? null : vendorCommissionTotal,
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

class Branch {
    Branch({
        @required this.location,
        @required this.id,
        @required this.name,
        @required this.supportNumber,
    });

    final BranchLocation location;
    final String id;
    final String name;
    final dynamic supportNumber;

    factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        location: json["location"] == null ? null : BranchLocation.fromJson(json["location"]),
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        supportNumber: json["supportNumber"] == null ? null : json["supportNumber"],
    );

    Map<String, dynamic> toJson() => {
        "location": location == null ? null : location.toJson(),
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "supportNumber": supportNumber == null ? null : supportNumber,
    };
}

class BranchLocation {
    BranchLocation({
        @required this.type,
        @required this.coordinates,
        @required this.address,
    });

    final String type;
    final List<double> coordinates;
    final String address;

    factory BranchLocation.fromJson(Map<String, dynamic> json) => BranchLocation(
        type: json["type"] == null ? null : json["type"],
        coordinates: json["coordinates"] == null ? null : List<double>.from(json["coordinates"].map((x) => x.toDouble())),
        address: json["address"] == null ? null : json["address"],
    );

    Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "coordinates": coordinates == null ? null : List<dynamic>.from(coordinates.map((x) => x)),
        "address": address == null ? null : address,
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
        type: json["type"] == null ? '' : json["type"],
        commission: json["commission"] == null ? '' : json["commission"],
        commissionAmount: json["commissionAmount"] == null ? '' : json["commissionAmount"],
    );

    Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "commission": commission == null ? null : commission,
        "commissionAmount": commissionAmount == null ? null : commissionAmount,
    };
}

class Customer {
    Customer({
        @required this.id,
        @required this.user,
        @required this.name,
    });

    final String id;
    final String user;
    final String name;

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["_id"] == null ? null : json["_id"],
        user: json["user"] == null ? null : json["user"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "user": user == null ? null : user,
        "name": name == null ? null : name,
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
        offerPrice: json["offerPrice"],
        packingCharge: json["packingCharge"] == null ? null : json["packingCharge"],
        qty: json["qty"] == null ? null : json["qty"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "maafosPrice": maafosPrice == null ? null : maafosPrice,
        "price": price == null ? null : price,
        "offerPrice": offerPrice,
        "packingCharge": packingCharge == null ? null : packingCharge,
        "qty": qty == null ? null : qty,
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

class Vendor {
    Vendor({
        @required this.location,
        @required this.contactNumber,
        @required this.id,
        @required this.name,
    });

    final VendorLocation location;
    final dynamic contactNumber;
    final String id;
    final String name;

    factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        location: json["location"] == null ? null : VendorLocation.fromJson(json["location"]),
        contactNumber: json["contactNumber"] == null ? null : json["contactNumber"],
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "location": location == null ? null : location.toJson(),
        "contactNumber": contactNumber == null ? null : contactNumber,
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
    };
}

class VendorLocation {
    VendorLocation({
        @required this.type,
        @required this.formattedAddress,
        @required this.address,
        @required this.coordinates,
        @required this.landmark,
    });

    final String type;
    final String formattedAddress;
    final String address;
    final List<double> coordinates;
    final String landmark;

    factory VendorLocation.fromJson(Map<String, dynamic> json) => VendorLocation(
        type: json["type"] == null ? null : json["type"],
        formattedAddress: json["formattedAddress"] == null ? null : json["formattedAddress"],
        address: json["address"] == null ? null : json["address"],
        coordinates: json["coordinates"] == null ? null : List<double>.from(json["coordinates"].map((x) => x.toDouble())),
        landmark: json["landmark"] == null ? null : json["landmark"],
    );

    Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "formattedAddress": formattedAddress == null ? null : formattedAddress,
        "address": address == null ? null : address,
        "coordinates": coordinates == null ? null : List<dynamic>.from(coordinates.map((x) => x)),
        "landmark": landmark == null ? null : landmark,
    };
}
