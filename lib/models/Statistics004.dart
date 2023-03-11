// To parse this JSON data, do
//
//     final statistics004 = statistics004FromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Statistics004 statistics004FromJson(String str) => Statistics004.fromJson(json.decode(str));

String statistics004ToJson(Statistics004? data) => json.encode(data!.toJson());

class Statistics004 {
  Statistics004({
    required this.success,
    required this.data,
    required this.message,
  });

  bool? success;
  Data? data;
  String? message;

  factory Statistics004.fromJson(Map<String, dynamic> json) => Statistics004(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data!.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    required this.employeeCount,
    required this.headCount,
    required this.vacationCount,
    required this.waitingVacations,
    required this.todayAcceptedVacations,
  });

  int? employeeCount;
  int? headCount;
  int? vacationCount;
  List<Vacation>? waitingVacations;
  List<Vacation>? todayAcceptedVacations;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    employeeCount: json["employeeCount"],
    headCount: json["headCount"],
    vacationCount: json["vacationCount"],

    // waitingVacations: json["waitingVacations"] == null ? [] : List<Vacation?>.from(json["waitingVacations"]!.map((x) => Vacation.fromJson(x))),
    // todayAcceptedVacations: json["todayAcceptedVacations"] == null ? [] : List<Vacation?>.from(json["todayAcceptedVacations"]!.map((x) => Vacation.fromJson(x))),


    waitingVacations:json["waitingVacations"]!.map((x) => Vacation.fromJson(x)),
    todayAcceptedVacations:json["todayAcceptedVacations"]!.map((x) => Vacation.fromJson(x)),
  );

  Map<String, dynamic> toJson() => {
    "employeeCount": employeeCount,
    "headCount": headCount,
    "vacationCount": vacationCount,
    "waitingVacations": waitingVacations == null ? [] : List<dynamic>.from(waitingVacations!.map((x) => x!.toJson())),
    "todayAcceptedVacations": todayAcceptedVacations == null ? [] : List<dynamic>.from(todayAcceptedVacations!.map((x) => x!.toJson())),
  };
}

class Vacation {
  Vacation({
    required this.id,
    required this.jobId,
    required this.headId,
    required this.startDate,
    required this.endDate,
    required this.reasons,
    required this.requestStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  int? id;
  int? jobId;
  int? headId;
  DateTime? startDate;
  DateTime? endDate;
  dynamic reasons;
  int? requestStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  factory Vacation.fromJson(Map<String, dynamic> json) => Vacation(
    id: json["id"],
    jobId: json["job_id"],
    headId: json["head_id"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    reasons: json["reasons"],
    requestStatus: json["request_status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "job_id": jobId,
    "head_id": headId,
    "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    "reasons": reasons,
    "request_status": requestStatus,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "user": user!.toJson(),
  };
}

class User {
  User({
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
  dynamic internalPhone;
  int? role;
  int? changePassword;
  int? managerId;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
