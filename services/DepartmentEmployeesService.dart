import 'package:http/http.dart' as http;
import 'package:test01/models/DepartmentEmployeesData.dart';
import '../login_screen/LoginPage.dart';

class DepartmentEmployeesService{
  Future<DepartmentEmployeesData?> getDepartmentEmployees() async{

    Uri myURL =Uri.https('emp.almatin.com','/api/departmentEmployees',{'q':'dart'});
    http.Response response= await http.get(myURL,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $token_test'
        });
    var json=response.body;
    // List<Datum> model = List<Datum>.from( jsonResult['data'].map( (x) => UserModel.fromJson(x)));
    print(json);
    return departmentEmployeesDataFromJson(json);
  }
}