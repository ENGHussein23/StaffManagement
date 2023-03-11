/// success : true
/// data : {"employeeCount":891,"headCount":23,"vacationCount":1,"Vacations":[{"id":23,"job_id":5212,"head_id":3561,"start_date":"2023-01-09","end_date":"2023-01-09","reasons":null,"request_status":3,"created_at":"2023-01-09T06:22:03.000000Z","updated_at":"2023-01-09T06:42:54.000000Z","user":{"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":null,"role":99,"change_password":0,"manager_id":3561}},{"id":23,"job_id":5212,"head_id":3561,"start_date":"2023-01-09","end_date":"2023-01-09","reasons":null,"request_status":3,"created_at":"2023-01-09T06:22:03.000000Z","updated_at":"2023-01-09T06:42:54.000000Z","user":{"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":null,"role":99,"change_password":0,"manager_id":3561}}],"WaitingVacations":[{"id":23,"job_id":5212,"head_id":3561,"start_date":"2023-01-09","end_date":"2023-01-09","reasons":null,"request_status":3,"created_at":"2023-01-09T06:22:03.000000Z","updated_at":"2023-01-09T06:42:54.000000Z","user":{"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":null,"role":99,"change_password":0,"manager_id":3561}},{"id":23,"job_id":5212,"head_id":3561,"start_date":"2023-01-09","end_date":"2023-01-09","reasons":null,"request_status":3,"created_at":"2023-01-09T06:22:03.000000Z","updated_at":"2023-01-09T06:42:54.000000Z","user":{"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":null,"role":99,"change_password":0,"manager_id":3561}},null]}
/// message : "Statistics Count"

class Statistics003 {
  Statistics003({
      bool? success, 
      Data? data, 
      String? message,}){
    _success = success;
    _data = data;
    _message = message;
}

  Statistics003.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _success;
  Data? _data;
  String? _message;
Statistics003 copyWith({  bool? success,
  Data? data,
  String? message,
}) => Statistics003(  success: success ?? _success,
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
/// Vacations : [{"id":23,"job_id":5212,"head_id":3561,"start_date":"2023-01-09","end_date":"2023-01-09","reasons":null,"request_status":3,"created_at":"2023-01-09T06:22:03.000000Z","updated_at":"2023-01-09T06:42:54.000000Z","user":{"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":null,"role":99,"change_password":0,"manager_id":3561}},{"id":23,"job_id":5212,"head_id":3561,"start_date":"2023-01-09","end_date":"2023-01-09","reasons":null,"request_status":3,"created_at":"2023-01-09T06:22:03.000000Z","updated_at":"2023-01-09T06:42:54.000000Z","user":{"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":null,"role":99,"change_password":0,"manager_id":3561}}]
/// WaitingVacations : [{"id":23,"job_id":5212,"head_id":3561,"start_date":"2023-01-09","end_date":"2023-01-09","reasons":null,"request_status":3,"created_at":"2023-01-09T06:22:03.000000Z","updated_at":"2023-01-09T06:42:54.000000Z","user":{"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":null,"role":99,"change_password":0,"manager_id":3561}},{"id":23,"job_id":5212,"head_id":3561,"start_date":"2023-01-09","end_date":"2023-01-09","reasons":null,"request_status":3,"created_at":"2023-01-09T06:22:03.000000Z","updated_at":"2023-01-09T06:42:54.000000Z","user":{"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":null,"role":99,"change_password":0,"manager_id":3561}},null]

class Data {
  Data({
      int? employeeCount, 
      int? headCount, 
      int? vacationCount, 
      List<Vacations>? todayAcceptedVacations,
      List<Vacations>? waitingVacations,}){
    _employeeCount = employeeCount;
    _headCount = headCount;
    _vacationCount = vacationCount;
    _todayAcceptedVacations = todayAcceptedVacations;
    _waitingVacations = waitingVacations;
}

  Data.fromJson(dynamic json) {
    _employeeCount = json['employeeCount'];
    _headCount = json['headCount'];
    _vacationCount = json['vacationCount'];
    if (json['todayAcceptedVacations'] != null) {
      _todayAcceptedVacations = [];
      json['todayAcceptedVacations'].forEach((v) {
        _todayAcceptedVacations?.add(Vacations.fromJson(v));
      });
    }
    if (json['waitingVacations'] != null) {
      _waitingVacations = [];
      json['waitingVacations'].forEach((v) {
        _waitingVacations?.add(Vacations.fromJson(v));
      });
    }
  }
  int? _employeeCount;
  int? _headCount;
  int? _vacationCount;
  List<Vacations>? _todayAcceptedVacations;
  List<Vacations>? _waitingVacations;
Data copyWith({  int? employeeCount,
  int? headCount,
  int? vacationCount,
  List<Vacations>? todayAcceptedVacations,
  List<Vacations>? waitingVacations,
}) => Data(  employeeCount: employeeCount ?? _employeeCount,
  headCount: headCount ?? _headCount,
  vacationCount: vacationCount ?? _vacationCount,
  todayAcceptedVacations: todayAcceptedVacations ?? _todayAcceptedVacations,
  waitingVacations: waitingVacations ?? _waitingVacations,
);
  int? get employeeCount => _employeeCount;
  int? get headCount => _headCount;
  int? get vacationCount => _vacationCount;
  List<Vacations>? get todayAcceptedVacations => _todayAcceptedVacations;
  List<Vacations>? get waitingVacations => _waitingVacations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['employeeCount'] = _employeeCount;
    map['headCount'] = _headCount;
    map['vacationCount'] = _vacationCount;
    if (_todayAcceptedVacations != null) {
      map['todayAcceptedVacations'] = _todayAcceptedVacations?.map((v) => v.toJson()).toList();
    }
    if (_waitingVacations != null) {
      map['waitingVacations'] = _waitingVacations?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 23
/// job_id : 5212
/// head_id : 3561
/// start_date : "2023-01-09"
/// end_date : "2023-01-09"
/// reasons : null
/// request_status : 3
/// created_at : "2023-01-09T06:22:03.000000Z"
/// updated_at : "2023-01-09T06:42:54.000000Z"
/// user : {"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":null,"role":99,"change_password":0,"manager_id":3561}

// class WaitingVacations {
//   WaitingVacations({
//       int? id,
//       int? jobId,
//       int? headId,
//       String? startDate,
//       String? endDate,
//       dynamic reasons,
//       int? requestStatus,
//       String? createdAt,
//       String? updatedAt,
//       User? user,}){
//     _id = id;
//     _jobId = jobId;
//     _headId = headId;
//     _startDate = startDate;
//     _endDate = endDate;
//     _reasons = reasons;
//     _requestStatus = requestStatus;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _user = user;
// }
//
//   WaitingVacations.fromJson(dynamic json) {
//     _id = json['id'];
//     _jobId = json['job_id'];
//     _headId = json['head_id'];
//     _startDate = json['start_date'];
//     _endDate = json['end_date'];
//     _reasons = json['reasons'];
//     _requestStatus = json['request_status'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//     _user = json['user'] != null ? User.fromJson(json['user']) : null;
//   }
//   int? _id;
//   int? _jobId;
//   int? _headId;
//   String? _startDate;
//   String? _endDate;
//   dynamic _reasons;
//   int? _requestStatus;
//   String? _createdAt;
//   String? _updatedAt;
//   User? _user;
// WaitingVacations copyWith({  int? id,
//   int? jobId,
//   int? headId,
//   String? startDate,
//   String? endDate,
//   dynamic reasons,
//   int? requestStatus,
//   String? createdAt,
//   String? updatedAt,
//   User? user,
// }) => WaitingVacations(  id: id ?? _id,
//   jobId: jobId ?? _jobId,
//   headId: headId ?? _headId,
//   startDate: startDate ?? _startDate,
//   endDate: endDate ?? _endDate,
//   reasons: reasons ?? _reasons,
//   requestStatus: requestStatus ?? _requestStatus,
//   createdAt: createdAt ?? _createdAt,
//   updatedAt: updatedAt ?? _updatedAt,
//   user: user ?? _user,
// );
//   int? get id => _id;
//   int? get jobId => _jobId;
//   int? get headId => _headId;
//   String? get startDate => _startDate;
//   String? get endDate => _endDate;
//   dynamic get reasons => _reasons;
//   int? get requestStatus => _requestStatus;
//   String? get createdAt => _createdAt;
//   String? get updatedAt => _updatedAt;
//   User? get user => _user;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['job_id'] = _jobId;
//     map['head_id'] = _headId;
//     map['start_date'] = _startDate;
//     map['end_date'] = _endDate;
//     map['reasons'] = _reasons;
//     map['request_status'] = _requestStatus;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     if (_user != null) {
//       map['user'] = _user?.toJson();
//     }
//     return map;
//   }
//
// }

/// name : "حسين علي الحاج علي"
/// job_id : 5212
/// address : "مساكن الإدخار /بناء الشرطة"
/// place_of_job : "الادارة العامة"
/// phone : "0945825568"
/// internal_phone : null
/// role : 99
/// change_password : 0
/// manager_id : 3561

class User {
  User({
      String? name, 
      int? jobId, 
      String? address, 
      String? placeOfJob, 
      String? phone, 
      dynamic internalPhone, 
      int? role, 
      int? changePassword, 
      int? managerId,}){
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
  int? _jobId;
  String? _address;
  String? _placeOfJob;
  String? _phone;
  dynamic _internalPhone;
  int? _role;
  int? _changePassword;
  int? _managerId;
User copyWith({  String? name,
  int? jobId,
  String? address,
  String? placeOfJob,
  String? phone,
  dynamic internalPhone,
  int? role,
  int? changePassword,
  int? managerId,
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
  int? get jobId => _jobId;
  String? get address => _address;
  String? get placeOfJob => _placeOfJob;
  String? get phone => _phone;
  dynamic get internalPhone => _internalPhone;
  int? get role => _role;
  int? get changePassword => _changePassword;
  int? get managerId => _managerId;

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
/// reasons : null
/// request_status : 3
/// created_at : "2023-01-09T06:22:03.000000Z"
/// updated_at : "2023-01-09T06:42:54.000000Z"
/// user : {"name":"حسين علي الحاج علي","job_id":5212,"address":"مساكن الإدخار /بناء الشرطة","place_of_job":"الادارة العامة","phone":"0945825568","internal_phone":null,"role":99,"change_password":0,"manager_id":3561}

class Vacations {
  Vacations({
      int? id, 
      int? jobId, 
      int? headId, 
      String? startDate, 
      String? endDate, 
      String? reasons,
      int? requestStatus, 
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

  Vacations.fromJson(dynamic json) {
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
  int? _id;
  int? _jobId;
  int? _headId;
  String? _startDate;
  String? _endDate;
  dynamic _reasons;
  int? _requestStatus;
  String? _createdAt;
  String? _updatedAt;
  User? _user;
Vacations copyWith({  int? id,
  int? jobId,
  int? headId,
  String? startDate,
  String? endDate,
  dynamic reasons,
  int? requestStatus,
  String? createdAt,
  String? updatedAt,
  User? user,
}) => Vacations(  id: id ?? _id,
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
  int? get id => _id;
  int? get jobId => _jobId;
  int? get headId => _headId;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  dynamic get reasons => _reasons;
  int? get requestStatus => _requestStatus;
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
/// internal_phone : null
/// role : 99
/// change_password : 0
/// manager_id : 3561

// class User {
//   User({
//       String? name,
//       int? jobId,
//       String? address,
//       String? placeOfJob,
//       String? phone,
//       dynamic internalPhone,
//       int? role,
//       int? changePassword,
//       int? managerId,}){
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
//   int? _jobId;
//   String? _address;
//   String? _placeOfJob;
//   String? _phone;
//   dynamic _internalPhone;
//   int? _role;
//   int? _changePassword;
//   int? _managerId;
// User copyWith({  String? name,
//   int? jobId,
//   String? address,
//   String? placeOfJob,
//   String? phone,
//   dynamic internalPhone,
//   int? role,
//   int? changePassword,
//   int? managerId,
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
//   int? get jobId => _jobId;
//   String? get address => _address;
//   String? get placeOfJob => _placeOfJob;
//   String? get phone => _phone;
//   dynamic get internalPhone => _internalPhone;
//   int? get role => _role;
//   int? get changePassword => _changePassword;
//   int? get managerId => _managerId;
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