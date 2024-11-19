// To parse this JSON data, do
//
//     final userDetailsModelClass = userDetailsModelClassFromJson(jsonString);

import 'dart:convert';

UserDetailsModelClass userDetailsModelClassFromJson(String str) => UserDetailsModelClass.fromJson(json.decode(str));

String userDetailsModelClassToJson(UserDetailsModelClass data) => json.encode(data.toJson());

class UserDetailsModelClass {
  DateTime createdAt;
  String name;
  String avatar;
  String email;
  String mobileNumber;
  String currency;
  bool isActive;
  String totalUnpaidBooking;
  int availableLimit;
  String id;
  String companyId;

  UserDetailsModelClass({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.email,
    required this.mobileNumber,
    required this.currency,
    required this.isActive,
    required this.totalUnpaidBooking,
    required this.availableLimit,
    required this.id,
    required this.companyId,
  });

  factory UserDetailsModelClass.fromJson(Map<String, dynamic> json) => UserDetailsModelClass(
    createdAt: DateTime.parse(json["createdAt"]),
    name: json["name"],
    avatar: json["avatar"],
    email: json["email"],
    mobileNumber: json["mobileNumber"],
    currency: json["currency"],
    isActive: json["isActive"],
    totalUnpaidBooking: json["totalUnpaidBooking"],
    availableLimit: json["availableLimit"],
    id: json["id"],
    companyId: json["companyId"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "name": name,
    "avatar": avatar,
    "email": email,
    "mobileNumber": mobileNumber,
    "currency": currency,
    "isActive": isActive,
    "totalUnpaidBooking": totalUnpaidBooking,
    "availableLimit": availableLimit,
    "id": id,
    "companyId": companyId,
  };
}
