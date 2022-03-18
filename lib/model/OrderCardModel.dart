// To parse this JSON data, do
//
//     final orderCardModel = orderCardModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OrderCardModel orderCardModelFromJson(String str) => OrderCardModel.fromJson(json.decode(str));

String orderCardModelToJson(OrderCardModel data) => json.encode(data.toJson());

class OrderCardModel {
    OrderCardModel({
        @required this.success,
        @required this.pagination,
        @required this.message,
        @required this.data,
    });

    final bool success;
    final Pagination pagination;
    final String message;
    final List<Datum> data;

    factory OrderCardModel.fromJson(Map<String, dynamic> json) => OrderCardModel(
        success: json["success"] == null ? null : json["success"],
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "pagination": pagination == null ? null : pagination.toJson(),
        "message": message == null ? null : message,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        @required this.orderStatus,
        @required this.id,
        @required this.vendor,
        @required this.items,
        @required this.deliveryCharge,
        @required this.paymentType,
        @required this.address,
        @required this.customer,
        @required this.totalAmount,
        @required this.orderId,
        @required this.createdAt,
        @required this.updatedAt,
    });

    final String orderStatus;
    final String id;
    final Vendor vendor;
    final List<Item> items;
    final dynamic deliveryCharge;
    final String paymentType;
    final Address address;
    final Customer customer;
    final dynamic totalAmount;
    final String orderId;
    final String createdAt;
    final String updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        orderStatus: json["orderStatus"] == null ? null : json["orderStatus"],
        id: json["_id"] == null ? null : json["_id"],
        vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
        items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        deliveryCharge: json["deliveryCharge"] == null ? null : json["deliveryCharge"],
        paymentType: json["paymentType"] == null ? null : json["paymentType"],
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
        totalAmount: json["totalAmount"] == null ? null : json["totalAmount"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
    );

    Map<String, dynamic> toJson() => {
        "orderStatus": orderStatus == null ? null : orderStatus,
        "_id": id == null ? null : id,
        "vendor": vendor == null ? null : vendor.toJson(),
        "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
        "deliveryCharge": deliveryCharge == null ? null : deliveryCharge,
        "paymentType": paymentType == null ? null : paymentType,
        "address": address == null ? null : address.toJson(),
        "customer": customer == null ? null : customer.toJson(),
        "totalAmount": totalAmount == null ? null : totalAmount,
        "orderId": orderId == null ? null : orderId,
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
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

class Customer {
    Customer({
        @required this.id,
        @required this.name,
    });

    final String id;
    final String name;

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
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

class Vendor {
    Vendor({
        @required this.location,
        @required this.id,
        @required this.name,
    });

    final Location location;
    final String id;
    final String name;

    factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "location": location == null ? null : location.toJson(),
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
    };
}

class Location {
    Location({
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

    factory Location.fromJson(Map<String, dynamic> json) => Location(
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

class Pagination {
    Pagination({
        @required this.next,
    });

    final Next next;

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        next: json["next"] == null ? null : Next.fromJson(json["next"]),
    );

    Map<String, dynamic> toJson() => {
        "next": next == null ? null : next.toJson(),
    };
}

class Next {
    Next({
        @required this.page,
        @required this.limit,
    });

    final dynamic page;
    final dynamic limit;

    factory Next.fromJson(Map<String, dynamic> json) => Next(
        page: json["page"] == null ? null : json["page"],
        limit: json["limit"] == null ? null : json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "limit": limit == null ? null : limit,
    };
}
