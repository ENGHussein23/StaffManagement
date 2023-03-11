/// success : true
/// data : {"employeeCount":891,"headCount":23,"vacationCount":1,"waitingVacations":[{"id":23,"job_id":5212,"head_id":3561,"start_date":"2023-01-09","end_date":"2023-01-09","reasons":"","request_status":3,"created_at":"2023-01-09T06:22:03.000000Z","updated_at":"2023-01-09T06:42:54.000000Z","user":{"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":163,"role":99,"change_password":0,"manager_id":3561}},{"id":23,"job_id":5212,"head_id":3561,"start_date":"2023-01-09","end_date":"2023-01-09","reasons":"aa","request_status":3,"created_at":"2023-01-09T06:22:03.000000Z","updated_at":"2023-01-09T06:42:54.000000Z","user":{"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":163,"role":99,"change_password":0,"manager_id":3561}}],"todayAcceptedVacations":[{"id":23,"job_id":5212,"head_id":3561,"start_date":"2023-01-09","end_date":"2023-01-09","reasons":"","request_status":3,"created_at":"2023-01-09T06:22:03.000000Z","updated_at":"2023-01-09T06:42:54.000000Z","user":{"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":163,"role":99,"change_password":0,"manager_id":3561}},{"id":23,"job_id":5212,"head_id":3561,"start_date":"2023-01-09","end_date":"2023-01-09","reasons":"","request_status":3,"created_at":"2023-01-09T06:22:03.000000Z","updated_at":"2023-01-09T06:42:54.000000Z","user":{"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":163,"role":99,"change_password":0,"manager_id":3561}}]}
/// message : "Statistics Count"

class Statistics002 {
  Statistics002({
      bool? success, 
      Data? data, 
      String? message,}){
    _success = success;
    _data = data;
    _message = message;
}

  Statistics002.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _success;
  Data? _data;
  String? _message;
Statistics002 copyWith({  bool? success,
  Data? data,
  String? message,
}) => Statistics002(  success: success ?? _success,
  data: data ?? _data,
  message: message ?? _message,
);
  bool? get success => _success;
  Data? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// employeeCount : 891
/// headCount : 23
/// vacationCount : 1
/// waitingVacations : [{"id":23,"job_id":5212,"head_id":3561,"start_date":"2023-01-09","end_date":"2023-01-09","reasons":"","request_status":3,"created_at":"2023-01-09T06:22:03.000000Z","updated_at":"2023-01-09T06:42:54.000000Z","user":{"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":163,"role":99,"change_password":0,"manager_id":3561}},{"id":23,"job_id":5212,"head_id":3561,"start_date":"2023-01-09","end_date":"2023-01-09","reasons":"aa","request_status":3,"created_at":"2023-01-09T06:22:03.000000Z","updated_at":"2023-01-09T06:42:54.000000Z","user":{"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":163,"role":99,"change_password":0,"manager_id":3561}}]
/// todayAcceptedVacations : [{"id":23,"job_id":5212,"head_id":3561,"start_date":"2023-01-09","end_date":"2023-01-09","reasons":"","request_status":3,"created_at":"2023-01-09T06:22:03.000000Z","updated_at":"2023-01-09T06:42:54.000000Z","user":{"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":163,"role":99,"change_password":0,"manager_id":3561}},{"id":23,"job_id":5212,"head_id":3561,"start_date":"2023-01-09","end_date":"2023-01-09","reasons":"","request_status":3,"created_at":"2023-01-09T06:22:03.000000Z","updated_at":"2023-01-09T06:42:54.000000Z","user":{"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":163,"role":99,"change_password":0,"manager_id":3561}}]

class Data {
  Data({
      num? employeeCount, 
      num? headCount, 
      num? vacationCount, 
      List<WaitingVacations>? waitingVacations, 
      List<TodayAcceptedVacations>? todayAcceptedVacations,}){
    _employeeCount = employeeCount;
    _headCount = headCount;
    _vacationCount = vacationCount;
    _waitingVacations = waitingVacations;
    _todayAcceptedVacations = todayAcceptedVacations;
}

  Data.fromJson(dynamic json) {
    _employeeCount = json['employeeCount'];
    _headCount = json['headCount'];
    _vacationCount = json['vacationCount'];
    if (json['waitingVacations'] != null) {
      _waitingVacations = [];
      json['waitingVacations'].forEach((v) {
        _waitingVacations?.add(WaitingVacations.fromJson(v));
      });
    }
    if (json['todayAcceptedVacations'] != null) {
      _todayAcceptedVacations = [];
      json['todayAcceptedVacations'].forEach((v) {
        _todayAcceptedVacations?.add(TodayAcceptedVacations.fromJson(v));
      });
    }
  }
  num? _employeeCount;
  num? _headCount;
  num? _vacationCount;
  List<WaitingVacations>? _waitingVacations;
  List<TodayAcceptedVacations>? _todayAcceptedVacations;
Data copyWith({  num? employeeCount,
  num? headCount,
  num? vacationCount,
  List<WaitingVacations>? waitingVacations,
  List<TodayAcceptedVacations>? todayAcceptedVacations,
}) => Data(  employeeCount: employeeCount ?? _employeeCount,
  headCount: headCount ?? _headCount,
  vacationCount: vacationCount ?? _vacationCount,
  waitingVacations: waitingVacations ?? _waitingVacations,
  todayAcceptedVacations: todayAcceptedVacations ?? _todayAcceptedVacations,
);
  num? get employeeCount => _employeeCount;
  num? get headCount => _headCount;
  num? get vacationCount => _vacationCount;
  List<WaitingVacations>? get waitingVacations => _waitingVacations;
  List<TodayAcceptedVacations>? get todayAcceptedVacations => _todayAcceptedVacations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['employeeCount'] = _employeeCount;
    map['headCount'] = _headCount;
    map['vacationCount'] = _vacationCount;
    if (_waitingVacations != null) {
      map['waitingVacations'] = _waitingVacations?.map((v) => v.toJson()).toList();
    }
    if (_todayAcceptedVacations != null) {
      map['todayAcceptedVacations'] = _todayAcceptedVacations?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 23
/// job_id : 5212
/// head_id : 3561
/// start_date : "2023-01-09"
/// end_date : "2023-01-09"
/// reasons : ""
/// request_status : 3
/// created_at : "2023-01-09T06:22:03.000000Z"
/// updated_at : "2023-01-09T06:42:54.000000Z"
/// user : {"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":163,"role":99,"change_password":0,"manager_id":3561}

class TodayAcceptedVacations {
  TodayAcceptedVacations({
      num? id, 
      num? jobId, 
      num? headId, 
      String? startDate, 
      String? endDate, 
      String? reasons, 
      num? requestStatus, 
      String? createdAt, 
      String? updatedAt, 
      User? user,}){
    _id = id;
    _jobId = jobId;
    _headId = headId;
    _startDate = startDate;
    _endDate = endDate;
    _reasons = reasons;
    _requestStatus = requestStatus;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _user = user;
}

  TodayAcceptedVacations.fromJson(dynamic json) {
    _id = json['id'];
    _jobId = json['job_id'];
    _headId = json['head_id'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _reasons = json['reasons'];
    _requestStatus = json['request_status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  num? _id;
  num? _jobId;
  num? _headId;
  String? _startDate;
  String? _endDate;
  String? _reasons;
  num? _requestStatus;
  String? _createdAt;
  String? _updatedAt;
  User? _user;
TodayAcceptedVacations copyWith({  num? id,
  num? jobId,
  num? headId,
  String? startDate,
  String? endDate,
  String? reasons,
  num? requestStatus,
  String? createdAt,
  String? updatedAt,
  User? user,
}) => TodayAcceptedVacations(  id: id ?? _id,
  jobId: jobId ?? _jobId,
  headId: headId ?? _headId,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  reasons: reasons ?? _reasons,
  requestStatus: requestStatus ?? _requestStatus,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  user: user ?? _user,
);
  num? get id => _id;
  num? get jobId => _jobId;
  num? get headId => _headId;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get reasons => _reasons;
  num? get requestStatus => _requestStatus;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['job_id'] = _jobId;
    map['head_id'] = _headId;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['reasons'] = _reasons;
    map['request_status'] = _requestStatus;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// name : "حسين علي الحاج علي"
/// job_id : 5212
/// address : "مساكن الإدخار /بناء الشرطة"
/// place_of_job : "الادارة العامة"
/// phone : "0945825568"
/// internal_phone : 163
/// role : 99
/// change_password : 0
/// manager_id : 3561

class User {
  User({
      String? name, 
      num? jobId, 
      String? address, 
      String? placeOfJob, 
      String? phone, 
      num? internalPhone, 
      num? role, 
      num? changePassword, 
      num? managerId,}){
    _name = name;
    _jobId = jobId;
    _address = address;
    _placeOfJob = placeOfJob;
    _phone = phone;
    _internalPhone = internalPhone;
    _role = role;
    _changePassword = changePassword;
    _managerId = managerId;
}

  User.fromJson(dynamic json) {
    _name = json['name'];
    _jobId = json['job_id'];
    _address = json['address'];
    _placeOfJob = json['place_of_job'];
    _phone = json['phone'];
    _internalPhone = json['internal_phone'];
    _role = json['role'];
    _changePassword = json['change_password'];
    _managerId = json['manager_id'];
  }
  String? _name;
  num? _jobId;
  String? _address;
  String? _placeOfJob;
  String? _phone;
  num? _internalPhone;
  num? _role;
  num? _changePassword;
  num? _managerId;
User copyWith({  String? name,
  num? jobId,
  String? address,
  String? placeOfJob,
  String? phone,
  num? internalPhone,
  num? role,
  num? changePassword,
  num? managerId,
}) => User(  name: name ?? _name,
  jobId: jobId ?? _jobId,
  address: address ?? _address,
  placeOfJob: placeOfJob ?? _placeOfJob,
  phone: phone ?? _phone,
  internalPhone: internalPhone ?? _internalPhone,
  role: role ?? _role,
  changePassword: changePassword ?? _changePassword,
  managerId: managerId ?? _managerId,
);
  String? get name => _name;
  num? get jobId => _jobId;
  String? get address => _address;
  String? get placeOfJob => _placeOfJob;
  String? get phone => _phone;
  num? get internalPhone => _internalPhone;
  num? get role => _role;
  num? get changePassword => _changePassword;
  num? get managerId => _managerId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['job_id'] = _jobId;
    map['address'] = _address;
    map['place_of_job'] = _placeOfJob;
    map['phone'] = _phone;
    map['internal_phone'] = _internalPhone;
    map['role'] = _role;
    map['change_password'] = _changePassword;
    map['manager_id'] = _managerId;
    return map;
  }

}

/// id : 23
/// job_id : 5212
/// head_id : 3561
/// start_date : "2023-01-09"
/// end_date : "2023-01-09"
/// reasons : ""
/// request_status : 3
/// created_at : "2023-01-09T06:22:03.000000Z"
/// updated_at : "2023-01-09T06:42:54.000000Z"
/// user : {"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":163,"role":99,"change_password":0,"manager_id":3561}

class WaitingVacations {
  WaitingVacations({
      num? id, 
      num? jobId, 
      num? headId, 
      String? startDate, 
      String? endDate, 
      String? reasons, 
      num? requestStatus, 
      String? createdAt, 
      String? updatedAt, 
      User? user,}){
    _id = id;
    _jobId = jobId;
    _headId = headId;
    _startDate = startDate;
    _endDate = endDate;
    _reasons = reasons;
    _requestStatus = requestStatus;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _user = user;
}

  WaitingVacations.fromJson(dynamic json) {
    _id = json['id'];
    _jobId = json['job_id'];
    _headId = json['head_id'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _reasons = json['reasons'];
    _requestStatus = json['request_status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  num? _id;
  num? _jobId;
  num? _headId;
  String? _startDate;
  String? _endDate;
  String? _reasons;
  num? _requestStatus;
  String? _createdAt;
  String? _updatedAt;
  User? _user;
WaitingVacations copyWith({  num? id,
  num? jobId,
  num? headId,
  String? startDate,
  String? endDate,
  String? reasons,
  num? requestStatus,
  String? createdAt,
  String? updatedAt,
  User? user,
}) => WaitingVacations(  id: id ?? _id,
  jobId: jobId ?? _jobId,
  headId: headId ?? _headId,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  reasons: reasons ?? _reasons,
  requestStatus: requestStatus ?? _requestStatus,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  user: user ?? _user,
);
  num? get id => _id;
  num? get jobId => _jobId;
  num? get headId => _headId;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get reasons => _reasons;
  num? get requestStatus => _requestStatus;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['job_id'] = _jobId;
    map['head_id'] = _headId;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['reasons'] = _reasons;
    map['request_status'] = _requestStatus;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// name : "حسين علي الحاج علي"
/// job_id : 5212
/// address : "مساكن الإدخار /بناء الشرطة"
/// place_of_job : "الادارة العامة"
/// phone : "0945825568"
/// internal_phone : 163
/// role : 99
/// change_password : 0
/// manager_id : 3561

// class User {
//   User({
//       String? name,
//       num? jobId,
//       String? address,
//       String? placeOfJob,
//       String? phone,
//       num? internalPhone,
//       num? role,
//       num? changePassword,
//       num? managerId,}){
//     _name = name;
//     _jobId = jobId;
//     _address = address;
//     _placeOfJob = placeOfJob;
//     _phone = phone;
//     _internalPhone = internalPhone;
//     _role = role;
//     _changePassword = changePassword;
//     _managerId = managerId;
// }
//
//   User.fromJson(dynamic json) {
//     _name = json['name'];
//     _jobId = json['job_id'];
//     _address = json['address'];
//     _placeOfJob = json['place_of_job'];
//     _phone = json['phone'];
//     _internalPhone = json['internal_phone'];
//     _role = json['role'];
//     _changePassword = json['change_password'];
//     _managerId = json['manager_id'];
//   }
//   String? _name;
//   num? _jobId;
//   String? _address;
//   String? _placeOfJob;
//   String? _phone;
//   num? _internalPhone;
//   num? _role;
//   num? _changePassword;
//   num? _managerId;
// User copyWith({  String? name,
//   num? jobId,
//   String? address,
//   String? placeOfJob,
//   String? phone,
//   num? internalPhone,
//   num? role,
//   num? changePassword,
//   num? managerId,
// }) => User(  name: name ?? _name,
//   jobId: jobId ?? _jobId,
//   address: address ?? _address,
//   placeOfJob: placeOfJob ?? _placeOfJob,
//   phone: phone ?? _phone,
//   internalPhone: internalPhone ?? _internalPhone,
//   role: role ?? _role,
//   changePassword: changePassword ?? _changePassword,
//   managerId: managerId ?? _managerId,
// );
//   String? get name => _name;
//   num? get jobId => _jobId;
//   String? get address => _address;
//   String? get placeOfJob => _placeOfJob;
//   String? get phone => _phone;
//   num? get internalPhone => _internalPhone;
//   num? get role => _role;
//   num? get changePassword => _changePassword;
//   num? get managerId => _managerId;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['name'] = _name;
//     map['job_id'] = _jobId;
//     map['address'] = _address;
//     map['place_of_job'] = _placeOfJob;
//     map['phone'] = _phone;
//     map['internal_phone'] = _internalPhone;
//     map['role'] = _role;
//     map['change_password'] = _changePassword;
//     map['manager_id'] = _managerId;
//     return map;
//   }
//
// }