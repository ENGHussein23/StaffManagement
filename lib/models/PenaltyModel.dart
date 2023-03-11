// To parse this JSON data, do
//
//     final penaltyData = penaltyDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PenaltyData penaltyDataFromJson(String str) => PenaltyData.fromJson(json.decode(str));

String penaltyDataToJson(PenaltyData data) => json.encode(data.toJson());

class PenaltyData {
  PenaltyData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory PenaltyData.fromJson(Map<String, dynamic> json) => PenaltyData(
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
    required this.penalties,
    required this.finalAmmount,
    required this.penaltiesDate,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int jobId;
  String penalties;
  String finalAmmount;
  DateTime penaltiesDate;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    jobId: json["job_id"],
    penalties: json["penalties"],
    finalAmmount: json["final_ammount"],
    penaltiesDate: DateTime.parse(json["penalties_date"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "job_id": jobId,
    "penalties": penalties,
    "final_ammount": finalAmmount,
    "penalties_date": penaltiesDate.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
