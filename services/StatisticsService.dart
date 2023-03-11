import 'package:http/http.dart' as http;
import 'package:test01/models/StatisticsData.dart';
import '../login_screen/LoginPage.dart';

class StatisticsService{
  Future<StatisticsData?> getStatisticsStatus() async{
    Uri myURL =Uri.https('emp.almatin.com','/api/statistics',{'q':'dart'});
    http.Response response= await http.get(myURL,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $token_test'
        });
    var json=response.body;
    return statisticsDataFromJson(json);
  }
}