import 'package:test01/login_screen/LoginPage.dart';
import 'package:http/http.dart' as http;
import '../models/SalaryApi.dart';

class SalaryDataService{
  Future<SalaryData> getSalaryUser() async{
    Uri myURL =Uri.https('emp.almatin.com','/api/salary',{'q':'dart'});
    http.Response response= await http.get(myURL,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $token_test'
        });
    var json=response.body;
    return salaryDataFromJson(json);
  }
}