import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test01/models/FollowupModel.dart';
import '../login_screen/LoginPage.dart';

class FollowupService{
  Future<FollowupData> getFollowupUser() async{
    Uri myURL =Uri.https('emp.almatin.com','/api/followup',{'q':'dart'});
    http.Response response= await http.get(myURL,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $token_test'
        });
    var json=response.body;
    print(jsonDecode(json).toString());
    return followupDataFromJson(json);
  }
}