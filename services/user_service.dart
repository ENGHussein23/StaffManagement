import 'package:test01/models/user_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../login_screen/LoginPage.dart';

class UserService{
  Future<UserData> getUser() async{
    Uri myURL =Uri.https('emp.almatin.com','/api/',{'q':'dart'});
    http.Response response= await http.get(myURL,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $token_test'
        });
    var json=response.body;
    // print(json.decode(response.body));
    return userDataFromJson(json);
  }
}