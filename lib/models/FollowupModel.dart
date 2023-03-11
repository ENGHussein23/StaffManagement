// To parse this JSON data, do
//
//     final followupData = followupDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FollowupData followupDataFromJson(String str) => FollowupData.fromJson(json.decode(str));

String followupDataToJson(FollowupData data) => json.encode(data.toJson());

class FollowupData {
  FollowupData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory FollowupData.fromJson(Map<String, dynamic> json) => FollowupData(
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
    required this.idPhoto,
    required this.residenceDocument,
    required this.noConviction,
    required this.individualCivilRecord,
    required this.personalPhotos,
    required this.certificateCopy,
    required this.medicalReport,
    required this.militaryNotebook,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int jobId;
  int idPhoto;
  int residenceDocument;
  int noConviction;
  int individualCivilRecord;
  int personalPhotos;
  int certificateCopy;
  int medicalReport;
  int militaryNotebook;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    jobId: json["job_id"],
    idPhoto: json["id_photo"],
    residenceDocument: json["residence_document"],
    noConviction: json["no_conviction"],
    individualCivilRecord: json["individual_civil_record"],
    personalPhotos: json["personal_photos"],
    certificateCopy: json["certificate_copy"],
    medicalReport: json["medical_report"],
    militaryNotebook: json["military_notebook"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "job_id": jobId,
    "id_photo": idPhoto,
    "residence_document": residenceDocument,
    "no_conviction": noConviction,
    "individual_civil_record": individualCivilRecord,
    "personal_photos": personalPhotos,
    "certificate_copy": certificateCopy,
    "medical_report": medicalReport,
    "military_notebook": militaryNotebook,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
