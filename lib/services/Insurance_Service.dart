import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test01/models/InsuranceModel.dart';
import '../login_screen/LoginPage.dart';

class InsuranceService{
  Future<InsuranceData> getInsuranceUser() async{
    Uri myURL =Uri.https('emp.almatin.com','/api/insurance',{'q':'dart'});
    http.Response response= await http.get(myURL,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $token_test'
        });
    var json=response.body;
    print(jsonDecode(json).toString());
    return insuranceDataFromJson(json);
  }
}