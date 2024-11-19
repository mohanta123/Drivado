// To parse this JSON data, do
//
//     final companyDetailsModelClass = companyDetailsModelClassFromJson(jsonString);

import 'dart:convert';

CompanyDetailsModelClass companyDetailsModelClassFromJson(String str) => CompanyDetailsModelClass.fromJson(json.decode(str));

String companyDetailsModelClassToJson(CompanyDetailsModelClass data) => json.encode(data.toJson());

class CompanyDetailsModelClass {
  DateTime createdAt;
  String companyName;
  String logo;
  String email;
  String mobileNumber;
  String address;
  int gstNum;
  String totalUnpaidBooking;
  int availableCreditLimit;
  String id;

  CompanyDetailsModelClass({
    required this.createdAt,
    required this.companyName,
    required this.logo,
    required this.email,
    required this.mobileNumber,
    required this.address,
    required this.gstNum,
    required this.totalUnpaidBooking,
    required this.availableCreditLimit,
    required this.id,
  });

  factory CompanyDetailsModelClass.fromJson(Map<String, dynamic> json) => CompanyDetailsModelClass(
    createdAt: DateTime.parse(json["createdAt"]),
    companyName: json["companyName"],
    logo: json["logo"],
    email: json["email"],
    mobileNumber: json["mobileNumber"],
    address: json["address"],
    gstNum: json["gst_num"],
    totalUnpaidBooking: json["totalUnpaidBooking"],
    availableCreditLimit: json["availableCreditLimit"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "companyName": companyName,
    "logo": logo,
    "email": email,
    "mobileNumber": mobileNumber,
    "address": address,
    "gst_num": gstNum,
    "totalUnpaidBooking": totalUnpaidBooking,
    "availableCreditLimit": availableCreditLimit,
    "id": id,
  };
}
