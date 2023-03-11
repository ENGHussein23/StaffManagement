import 'package:http/http.dart' as http;
import 'package:test01/models/EvaluationModel.dart';
import '../login_screen/LoginPage.dart';

class EvaluationService{
  Future<EvaluationData> getEvaluationUser() async{
    Uri myURL =Uri.https('emp.almatin.com','/api/evaluation',{'q':'dart'});
    http.Response response= await http.get(myURL,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $token_test'
        });
    var json=response.body;
    return evaluationDataFromJson(json);
  }
}