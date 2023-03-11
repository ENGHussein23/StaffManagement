import 'package:http/http.dart' as http;
import 'package:test01/models/HeasdsDataModel.dart';
import '../login_screen/LoginPage.dart';

class HeadsService{
  Future<DepartmentHeadsData> getHeadsData() async{
    Uri myURL =Uri.https('emp.almatin.com','/api/statistics/head',{'q':'dart'});
    http.Response response= await http.get(myURL,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $token_test'
        });
    var json=response.body;
    print(json.toString());
    return departmentHeadsDataFromJson(json.toString());
  }
}