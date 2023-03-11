// To parse this JSON data, do
//
//     final departmentEmployeesData = departmentEmployeesDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DepartmentEmployeesData? departmentEmployeesDataFromJson(String str) => DepartmentEmployeesData.fromJson(json.decode(str));

String departmentEmployeesDataToJson(DepartmentEmployeesData? data) => json.encode(data!.toJson());

class DepartmentEmployeesData {
  DepartmentEmployeesData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool? success;
  List<Datum?>? data;
  String? message;

  factory DepartmentEmployeesData.fromJson(Map<String, dynamic> json) => DepartmentEmployeesData(
    success: json["success"],
    data: json["data"] == null ? [] : List<Datum?>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())),
    "message": message,
  };
}

class Datum {
  Datum({
    required this.name,
    required this.jobId,
    required this.address,
    required this.placeOfJob,
    required this.phone,
    required this.internalPhone,
    required this.role,
    required this.changePassword,
    required this.managerId,
  });

  String? name;
  int? jobId;
  String? address;
  String? placeOfJob;
  String? phone;
  String? internalPhone;
  int? role;
  int? changePassword;
  int? managerId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    jobId: json["job_id"],
    address: json["address"],
    placeOfJob: json["place_of_job"],
    phone: json["phone"],
    internalPhone: json["internal_phone"],
    role: json["role"],
    changePassword: json["change_password"],
    managerId: json["manager_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job_id": jobId,
    "address": address,
    "place_of_job": placeOfJob,
    "phone": phone,
    "internal_phone": internalPhone,
    "role": role,
    "change_password": changePassword,
    "manager_id": managerId,
  };
}
