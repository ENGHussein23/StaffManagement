// To parse this JSON data, do
//
//     final requestStatusData = requestStatusDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RequestStatusData? requestStatusDataFromJson(String str) => RequestStatusData.fromJson(json.decode(str));

String requestStatusDataToJson(RequestStatusData? data) => json.encode(data!.toJson());

class RequestStatusData {
  RequestStatusData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool? success;
  Data? data;
  String? message;

  factory RequestStatusData.fromJson(Map<String, dynamic> json) => RequestStatusData(
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
  dynamic reasons;
  int? requestStatus;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
