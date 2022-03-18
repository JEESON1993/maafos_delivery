// To parse this JSON data, do
//
//     final deliveryModel = deliveryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DeliveryModel deliveryModelFromJson(String str) => DeliveryModel.fromJson(json.decode(str));

String deliveryModelToJson(DeliveryModel data) => json.encode(data.toJson());

class DeliveryModel {
    DeliveryModel({
        @required this.success,
        @required this.delivery,
    });

    final bool success;
    final Delivery delivery;

    factory DeliveryModel.fromJson(Map<String, dynamic> json) => DeliveryModel(
        success: json["success"] == null ? null : json["success"],
        delivery: json["delivery"] == null ? null : Delivery.fromJson(json["delivery"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "delivery": delivery == null ? null : delivery.toJson(),
    };
}

class Delivery {
    Delivery({
        @required this.licenseProof,
        @required this.profilePic,
        @required this.floatingCash,
        @required this.status,
        @required this.id,
        @required this.user,
        @required this.branch,
        @required this.name,
        @required this.mobile,
        @required this.idNumber,
        @required this.dob,
        @required this.bloodGroup,
        @required this.email,
        @required this.place,
        @required this.createdAt,
        @required this.updatedAt,
        @required this.v,
        @required this.fcmToken,
    });

    final LicenseProof licenseProof;
    final LicenseProof profilePic;
    final dynamic floatingCash;
     bool status;
    final String id;
    final User user;
    final Branch branch;
    final String name;
    final dynamic mobile;
    final String idNumber;
    final String dob;
    final String bloodGroup;
    final String email;
    final String place;
    final String createdAt;
    final String updatedAt;
    final dynamic v;
    final String fcmToken;

    factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        licenseProof: json["licenseProof"] == null ? null : LicenseProof.fromJson(json["licenseProof"]),
        profilePic: json["profilePic"] == null ? null : LicenseProof.fromJson(json["profilePic"]),
        floatingCash: json["floatingCash"] == null ? null : json["floatingCash"],
        status: json["status"] == null ? null : json["status"],
        id: json["_id"] == null ? null : json["_id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
        name: json["name"] == null ? null : json["name"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        idNumber: json["idNumber"] == null ? null : json["idNumber"],
        dob: json["DOB"] == null ? null : json["DOB"],
        bloodGroup: json["bloodGroup"] == null ? null : json["bloodGroup"],
        email: json["email"] == null ? null : json["email"],
        place: json["place"] == null ? null : json["place"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        v: json["__v"] == null ? null : json["__v"],
        fcmToken: json["fcmToken"] == null ? null : json["fcmToken"],
    );

    Map<String, dynamic> toJson() => {
        "licenseProof": licenseProof == null ? null : licenseProof.toJson(),
        "profilePic": profilePic == null ? null : profilePic.toJson(),
        "floatingCash": floatingCash == null ? null : floatingCash,
        "status": status == null ? null : status,
        "_id": id == null ? null : id,
        "user": user == null ? null : user.toJson(),
        "branch": branch == null ? null : branch.toJson(),
        "name": name == null ? null : name,
        "mobile": mobile == null ? null : mobile,
        "idNumber": idNumber == null ? null : idNumber,
        "DOB": dob == null ? null : dob,
        "bloodGroup": bloodGroup == null ? null : bloodGroup,
        "email": email == null ? null : email,
        "place": place == null ? null : place,
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "__v": v == null ? null : v,
        "fcmToken": fcmToken == null ? null : fcmToken,
    };
}

class Branch {
    Branch({
        @required this.location,
        @required this.id,
        @required this.name,
        @required this.supportNumber,
    });

    final Location location;
    final String id;
    final String name;
    final dynamic supportNumber;

    factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
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

class Location {
    Location({
        @required this.address,
    });

    final String address;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        address: json["address"] == null ? null : json["address"],
    );

    Map<String, dynamic> toJson() => {
        "address": address == null ? null : address,
    };
}

class LicenseProof {
    LicenseProof({
        @required this.key,
        @required this.image,
    });

    final String key;
    final String image;

    factory LicenseProof.fromJson(Map<String, dynamic> json) => LicenseProof(
        key: json["key"] == null ? null : json["key"],
        image: json["image"] == null ? null : json["image"],
    );

    Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
        "image": image == null ? null : image,
    };
}

class User {
    User({
        @required this.id,
        @required this.username,
    });

    final String id;
    final String username;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"] == null ? null : json["_id"],
        username: json["username"] == null ? null : json["username"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "username": username == null ? null : username,
    };
}
