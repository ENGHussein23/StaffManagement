// To parse this JSON data, do
//
//     final statisticsData = statisticsDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

StatisticsData? statisticsDataFromJson(String str) => StatisticsData.fromJson(json.decode(str));

String statisticsDataToJson(StatisticsData? data) => json.encode(data!.toJson());

class StatisticsData {
  StatisticsData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool? success;
  Data? data;
  String? message;

  factory StatisticsData.fromJson(Map<String, dynamic> json) => StatisticsData(
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
  List<Vacation?>? waitingVacations;
  List<Vacation?>? todayAcceptedVacations;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    employeeCount: json["employeeCount"],
    headCount: json["headCount"],
    vacationCount: json["vacationCount"],
    waitingVacations: json["waitingVacations"] == null ? [] : List<Vacation?>.from(json["waitingVacations"]!.map((x) => Vacation.fromJson(x))),
    todayAcceptedVacations: json["todayAcceptedVacations"] == null ? [] : List<Vacation?>.from(json["todayAcceptedVacations"]!.map((x) => Vacation.fromJson(x))),
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
  });

  int? id;
  int? jobId;
  int? headId;
  DateTime? startDate;
  DateTime? endDate;
  String? reasons;
  int? requestStatus;
  DateTime? createdAt;
  DateTime? updatedAt;

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
  };
}
