// To parse this JSON data, do
//
//     final salaryData = salaryDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SalaryData salaryDataFromJson(String str) => SalaryData.fromJson(json.decode(str));

String salaryDataToJson(SalaryData data) => json.encode(data.toJson());

class SalaryData {
  SalaryData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory SalaryData.fromJson(Map<String, dynamic> json) => SalaryData(
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
    required this.baseSalary,
    required this.motivations,
    required this.livingCompensation,
    required this.additional,
    required this.foodAllowance,
    required this.productivityMotivations,
    required this.natureWork,
    required this.variableCompensation,
    required this.fixedCompensation,
    required this.totalBenefit,
    required this.absence,
    required this.absenceCut,
    required this.withoutSalary,
    required this.withoutSalaryCut,
    required this.lateCut,
    required this.mobileBill,
    required this.punishments,
    required this.ordinaryAdvance,
    required this.jop,
    required this.socialInsurance,
    required this.incomeTax,
    required this.cooperatBox,
    required this.netSalary,
    required this.severancePay,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int jobId;
  String baseSalary;
  String motivations;
  String livingCompensation;
  String additional;
  String foodAllowance;
  String productivityMotivations;
  String natureWork;
  String variableCompensation;
  String fixedCompensation;
  String totalBenefit;
  String absence;
  String absenceCut;
  String withoutSalary;
  String withoutSalaryCut;
  String lateCut;
  String mobileBill;
  String punishments;
  String ordinaryAdvance;
  String jop;
  String socialInsurance;
  String incomeTax;
  String cooperatBox;
  String netSalary;
  String severancePay;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    jobId: json["job_id"],
    baseSalary: json["base_salary"],
    motivations: json["motivations"],
    livingCompensation: json["living_compensation"],
    additional: json["additional"],
    foodAllowance: json["food_allowance"],
    productivityMotivations: json["productivity_motivations"],
    natureWork: json["nature_work"],
    variableCompensation: json["variable_compensation"],
    fixedCompensation: json["fixed_compensation"],
    totalBenefit: json["total_benefit"],
    absence: json["absence"],
    absenceCut: json["absence_cut"],
    withoutSalary: json["without_salary"],
    withoutSalaryCut: json["without_salary_cut"],
    lateCut: json["late_cut"],
    mobileBill: json["mobile_bill"],
    punishments: json["punishments"],
    ordinaryAdvance: json["ordinary_advance"],
    jop: json["jop"],
    socialInsurance: json["social_insurance"],
    incomeTax: json["income_tax"],
    cooperatBox: json["cooperat_box"],
    netSalary: json["net_salary"],
    severancePay: json["severance_pay"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "job_id": jobId,
    "base_salary": baseSalary,
    "motivations": motivations,
    "living_compensation": livingCompensation,
    "additional": additional,
    "food_allowance": foodAllowance,
    "productivity_motivations": productivityMotivations,
    "nature_work": natureWork,
    "variable_compensation": variableCompensation,
    "fixed_compensation": fixedCompensation,
    "total_benefit": totalBenefit,
    "absence": absence,
    "absence_cut": absenceCut,
    "without_salary": withoutSalary,
    "without_salary_cut": withoutSalaryCut,
    "late_cut": lateCut,
    "mobile_bill": mobileBill,
    "punishments": punishments,
    "ordinary_advance": ordinaryAdvance,
    "jop": jop,
    "social_insurance": socialInsurance,
    "income_tax": incomeTax,
    "cooperat_box": cooperatBox,
    "net_salary": netSalary,
    "severance_pay": severancePay,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
