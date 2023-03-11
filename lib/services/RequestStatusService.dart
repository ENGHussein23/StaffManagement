import 'package:http/http.dart' as http;
import 'package:test01/models/RequestStatusModel.dart';
import '../login_screen/LoginPage.dart';

class RequestStatusService{
  Future<RequestStatusData?> getRequestStatus() async{
    Uri myURL =Uri.https('emp.almatin.com','/api/requestVacation',{'q':'dart'});
    http.Response response= await http.get(myURL,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $token_test'
        });
    var json=response.body;
    return requestStatusDataFromJson(json);
  }
}