import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test01/models/DEMtest01.dart';
import '../login_screen/LoginPage.dart';

class DepartmentEmployeesService002 {
  Future<DeMtest01> getDepartmentApi() async {
    Uri myURL = Uri.https(
        'emp.almatin.com', '/api/departmentEmployees', {'q': 'dart'});
    http.Response response = await http.get(myURL,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token_test'
        });
    var jsonData = jsonDecode(response.body.toString());

    return DeMtest01.fromJson(jsonData);
  }
}