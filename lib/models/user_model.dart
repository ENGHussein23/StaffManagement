// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    required this.name,
    required this.jobId,
    required this.address,
    required this.placeOfJob,
    required this.phone,
    required this.internalPhone,
    required this.vacationStatus,
    required this.role,
    required this.changePassword,
    required this.managerId,
    required this.managerName,
  });

  String name;
  int jobId;
  String address;
  String placeOfJob;
  String phone;
  dynamic internalPhone;
  dynamic vacationStatus;
  int role;
  int changePassword;
  int managerId;
  String managerName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    jobId: json["job_id"],
    address: json["address"],
    placeOfJob: json["place_of_job"],
    phone: json["phone"],
    internalPhone: json["internal_phone"],
    vacationStatus: json["vacation_status"],
    role: json["role"],
    changePassword: json["change_password"],
    managerId: json["manager_id"],
    managerName: json["manager_name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job_id": jobId,
    "address": address,
    "place_of_job": placeOfJob,
    "phone": phone,
    "internal_phone": internalPhone,
    "vacation_status": vacationStatus,
    "role": role,
    "change_password": changePassword,
    "manager_id": managerId,
    "manager_name": managerName,
  };
}

