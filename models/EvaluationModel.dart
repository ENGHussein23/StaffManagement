// To parse this JSON data, do
//
//     final evaluationData = evaluationDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EvaluationData evaluationDataFromJson(String str) => EvaluationData.fromJson(json.decode(str));

String evaluationDataToJson(EvaluationData data) => json.encode(data.toJson());

class EvaluationData {
  EvaluationData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory EvaluationData.fromJson(Map<String, dynamic> json) => EvaluationData(
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
    required this.latestEvaluation,
    required this.managerEvaluation,
    required this.hrEvaluation,
    required this.pros,
    required this.cons,
    required this.managerRecommendations,
    required this.hrRecommendations,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int jobId;
  dynamic latestEvaluation;
  dynamic managerEvaluation;
  dynamic hrEvaluation;
  dynamic pros;
  dynamic cons;
  dynamic managerRecommendations;
  dynamic hrRecommendations;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    jobId: json["job_id"],
    latestEvaluation: json["latest_evaluation"],
    managerEvaluation: json["manager_evaluation"],
    hrEvaluation: json["hr_evaluation"],
    pros: json["pros"],
    cons: json["cons"],
    managerRecommendations: json["manager_recommendations"],
    hrRecommendations: json["hr_recommendations"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "job_id": jobId,
    "latest_evaluation": latestEvaluation,
    "manager_evaluation": managerEvaluation,
    "hr_evaluation": hrEvaluation,
    "pros": pros,
    "cons": cons,
    "manager_recommendations": managerRecommendations,
    "hr_recommendations": hrRecommendations,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
