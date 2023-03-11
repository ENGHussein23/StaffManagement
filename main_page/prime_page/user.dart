import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class User{
  String id;
  String name;
  String job_id;
  String address;
  String plase_of_jop;
  String phone;
  String manager_id;
  String internal_phone;
  String request_status;
  String role;
  String change_password;
  String created_at;
  String updated_at;

  User(

     this.id,
    this.name,
     this.job_id,
    this.address,
     this.plase_of_jop,
     this.phone,
     this.manager_id,
     this.internal_phone,
     this.request_status,
     this.role,
     this.change_password,
     this.created_at,
    this.updated_at

  );
  Future<List> getData() async{
    Uri myURL =Uri.http('test.almatin.com','/api/hello',{'q':'dart'});
    http.Response response= await http.get(myURL,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOWIxYTVhYTk4ODEwYjNkODllMzNhY2VhM2FiY2Y2ZDY2NWQzOTVhN2M3NDFhZWMxNGY3YTYzZmQzODNkZWQ3YTdiNDBiMDNkY2UyZmFjZjQiLCJpYXQiOjE2Njk4OTQ3NTIsIm5iZiI6MTY2OTg5NDc1MiwiZXhwIjoxNzAxNDMwNzUyLCJzdWIiOiI2ODgiLCJzY29wZXMiOltdfQ.L7OX7re5fIlbB3QJDx8oaUNljUDfiS9Alxq7l5xbSTSP2eDbgp88BOPhz2zxdijD4PUjR8przXuwKdjSau3LK2u1gwUfl_z2PguZfXxInOqTExKt0LA90_NSwAPTLV69P9wxyHxB8DLOykNvH_Y6OY6qaXKRlKHboX7HBgI4IUNnfIxdvF-hCHZ4VUVAmoPjPat4RqoQQZA7hp79yAANG_7yv-ZFu1Tz_t_tqpFzOQI8KwQmfFWbcZdAL9Xy24lstTU5ZHQJVZtg8GgFPN9ACVBWd6h4g8JAyYSjbBHeSIhOJqsI2QQclX2zI0a3gMFW9Enutk5P9etUZlIsVPSWfhRo9ooD5m3a4_TW6FeNwfTNTDPzIZ9v9h_gz7QSxKbpi89juQmfhKZ2nm_2HWpfhsruIGW0xaQyKiBkvZCavctzaFjTfrpwyW5dD7ZmtU-jJoz_IlukFo7NQOuYdZa2ylin6LnoUbQ8PjzQmz6_uLxeP18xRvsFoSQEgkZfpsdJAkFUT3SdlPjmkNr99KszsWSV33Y6-ldEDVxy35uWo1LNV1sRmF4k3egA_QxQ6-CAPQmGPDSNgv2_eHTIettkqOT1rhEjtHe24XX6EKHMzVxW2957nHVjeCrXl31W8WdhyRRMF5YFoHHtj5GID4BgZKFatNhYnrHVf_L365OMDOM'
        });
    print('111111111111111111111111111');
    print(json.decode(response.body));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  factory User.fromMap(Map<String, dynamic> json){
    return User(json['user.id'],json['user.name'],json['user.job_id'],
        json['user.address'],json['user.phone'],json['user.manager_id'],
        json['user.internal_phone'],json['user.request_status'],json['user.role'],
        json['user.change_password'],json['user.change_password'],
        json['user.created_at'],json['user.updated_at']);
  }


  factory User.fromJson(Map<String, dynamic> json){
    return User(json['user.id'],json['user.name'],json['user.job_id'],
        json['user.address'],json['user.phone'],json['user.manager_id'],
        json['user.internal_phone'],json['user.request_status'],json['user.role'],
        json['user.change_password'],json['user.change_password'],
        json['user.created_at'],json['user.updated_at']);

  }
}