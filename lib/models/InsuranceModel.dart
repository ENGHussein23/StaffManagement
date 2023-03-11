// To parse this JSON data, do
//
//     final insuranceData = insuranceDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
// Insurance
InsuranceData insuranceDataFromJson(String str) => InsuranceData.fromJson(json.decode(str));

String insuranceDataToJson(InsuranceData data) => json.encode(data.toJson());

class InsuranceData {
  InsuranceData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory InsuranceData.fromJson(Map<String, dynamic> json) => InsuranceData(
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
    required this.id,
    required this.jobId,
    required this.socialInsurance,
    required this.insuranceSalary,
    required this.dateRegistration,
    required this.socialInsuranceNumber,
    required this.remainingAdvance,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int jobId;
  int socialInsurance;
  String insuranceSalary;
  DateTime dateRegistration;
  int socialInsuranceNumber;
  dynamic remainingAdvance;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    jobId: json["job_id"],
    socialInsurance: json["social_insurance"],
    insuranceSalary: json["insurance_salary"],
    dateRegistration: DateTime.parse(json["date_registration"]),
    socialInsuranceNumber: json["social_insurance_number"],
    remainingAdvance: json["remaining_advance"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "job_id": jobId,
    "social_insurance": socialInsurance,
    "insurance_salary": insuranceSalary,
    "date_registration": dateRegistration,
    "social_insurance_number": socialInsuranceNumber,
    "remaining_advance": remainingAdvance,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
