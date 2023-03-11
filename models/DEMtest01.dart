/// success : true
/// data : [{"name":"ابراهيم سامي الابراهيم","job_id":5196,"address":"الاعور جانب مدرسة ابراهيم شعبان العلي","place_of_job":"رافيا 2","phone":"0991698097","internal_phone":"0","role":0,"change_password":0,"manager_id":5212},{"name":"ابراهيم سامي الابراهيم","job_id":5196,"address":"الاعور جانب مدرسة ابراهيم شعبان العلي","place_of_job":"رافيا 2","phone":"0991698097","internal_phone":"0","role":0,"change_password":0,"manager_id":5212}]
/// message : "Employees Data"

class DeMtest01 {
  DeMtest01({
      bool? success, 
      List<Data>? data, 
      String? message,}){
    _success = success;
    _data = data;
    _message = message;
}

  DeMtest01.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _message = json['message'];
  }
  bool? _success;
  List<Data>? _data;
  String? _message;
DeMtest01 copyWith({  bool? success,
  List<Data>? data,
  String? message,
}) => DeMtest01(  success: success ?? _success,
  data: data ?? _data,
  message: message ?? _message,
);
  bool? get success => _success;
  List<Data>? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// name : "ابراهيم سامي الابراهيم"
/// job_id : 5196
/// address : "الاعور جانب مدرسة ابراهيم شعبان العلي"
/// place_of_job : "رافيا 2"
/// phone : "0991698097"
/// internal_phone : "0"
/// role : 0
/// change_password : 0
/// manager_id : 5212

class Data {
  Data({
      String? name, 
      num? jobId, 
      String? address, 
      String? placeOfJob, 
      String? phone, 
      String? internalPhone, 
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

  Data.fromJson(dynamic json) {
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
  String? _internalPhone;
  num? _role;
  num? _changePassword;
  num? _managerId;
Data copyWith({  String? name,
  num? jobId,
  String? address,
  String? placeOfJob,
  String? phone,
  String? internalPhone,
  num? role,
  num? changePassword,
  num? managerId,
}) => Data(  name: name ?? _name,
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
  String? get internalPhone => _internalPhone;
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