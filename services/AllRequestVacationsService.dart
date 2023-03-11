import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test01/models/AllRequestVacationsTest002.dart';
import '../login_screen/LoginPage.dart';

class AllRequestVacationsServies {
  Future<AllRequestVacationsTest002> getAllRequestVacations() async {
    Uri myURL = Uri.https(
        'emp.almatin.com', '/api/allRequestVacations', {'q': 'dart'});
    http.Response response = await http.get(myURL,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token_test'
        });
    var jsonData = jsonDecode(response.body.toString());

    return AllRequestVacationsTest002.fromJson(jsonData);
  }
}