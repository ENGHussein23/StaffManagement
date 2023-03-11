import 'package:flutter/foundation.dart';
class EmpDetailsModel {
  String id;
  String name;
  String add;
  String work_location;
  String change_pass;
  String mobile;
  String head_id;
  String internal_number;

  String powers;
  EmpDetailsModel(this.id, this.name, this.add, this.work_location,
      this.change_pass, this.mobile, this.head_id, this.internal_number,
      this.powers);
}