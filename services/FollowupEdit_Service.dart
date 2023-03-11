import 'package:test01/login_screen/LoginPage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class FollowUpEdit_Service{
  final String _url="https://emp.almatin.com";
  postData(empdata,apiUrl) async {
    var fullUrl=_url+apiUrl;
    print(jsonEncode(empdata));
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(empdata),
      headers: _setHeaders(),
    );
  }

  _setHeaders()=>{
    'Content-type':'application/json',
    'Accept':'application/json',
    'Authorization':'Bearer $token_test',
  };
}