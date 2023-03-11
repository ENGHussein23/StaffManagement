/// success : true
/// data : [{"id":12,"job_id":5196,"head_id":5212,"start_date":"2023-01-07","end_date":"2023-01-07","reasons":null,"request_status":1,"created_at":"2023-01-07T07:41:21.000000Z","updated_at":"2023-01-07T07:41:21.000000Z"},{"id":10,"job_id":5196,"head_id":5212,"start_date":"2023-01-11","end_date":"2023-01-11","reasons":null,"request_status":1,"created_at":"2023-01-05T12:10:12.000000Z","updated_at":"2023-01-05T12:10:12.000000Z"},{"id":19,"job_id":5196,"head_id":5212,"start_date":"2023-01-07","end_date":"2023-01-07","reasons":null,"request_status":1,"created_at":"2023-01-07T08:30:35.000000Z","updated_at":"2023-01-07T08:30:35.000000Z"}]
/// message : "All Vacation Requests"

class AllRequestVacations {
  AllRequestVacations({
      bool? success, 
      List<Data>? data, 
      String? message,}){
    _success = success;
    _data = data;
    _message = message;
}

  AllRequestVacations.fromJson(dynamic json) {
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
AllRequestVacations copyWith({  bool? success,
  List<Data>? data,
  String? message,
}) => AllRequestVacations(  success: success ?? _success,
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

/// id : 12
/// job_id : 5196
/// head_id : 5212
/// start_date : "2023-01-07"
/// end_date : "2023-01-07"
/// reasons : null
/// request_status : 1
/// created_at : "2023-01-07T07:41:21.000000Z"
/// updated_at : "2023-01-07T07:41:21.000000Z"

class Data {
  Data({
      num? id, 
      num? jobId, 
      num? headId, 
      String? startDate, 
      String? endDate, 
      dynamic reasons, 
      num? requestStatus, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _jobId = jobId;
    _headId = headId;
    _startDate = startDate;
    _endDate = endDate;
    _reasons = reasons;
    _requestStatus = requestStatus;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _jobId = json['job_id'];
    _headId = json['head_id'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _reasons = json['reasons'];
    _requestStatus = json['request_status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _jobId;
  num? _headId;
  String? _startDate;
  String? _endDate;
  dynamic _reasons;
  num? _requestStatus;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  num? jobId,
  num? headId,
  String? startDate,
  String? endDate,
  dynamic reasons,
  num? requestStatus,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  jobId: jobId ?? _jobId,
  headId: headId ?? _headId,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  reasons: reasons ?? _reasons,
  requestStatus: requestStatus ?? _requestStatus,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get jobId => _jobId;
  num? get headId => _headId;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  dynamic get reasons => _reasons;
  num? get requestStatus => _requestStatus;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

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
    return map;
  }

}