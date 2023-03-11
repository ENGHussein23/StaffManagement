// import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'login_screen/LoginPage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:workmanager/workmanager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test01/main_page/vacation_requests/vacation_requests.dart';

const fetchBackground = "fetchBackground";
// const fetchBackgroundemp = "fetchBackgroundemp";

class GlobalcontextServive{
  static GlobalKey <NavigatorState> navigatorKey =
  GlobalKey <NavigatorState> ();

}
//////////////////////////////////////////////////////////////////////////////////////////
@pragma('vm:entry-point')
void callBackground(){
  Workmanager().executeTask((taskName, inputData) async {
    // callNotification();
    const String groupKey = 'grouped channel key';
    const String groupChannelId = 'grouped channel id';
    const String groupChannelName = 'grouped channel name';
    const String groupChannelDescription = 'grouped channel description';

    FlutterLocalNotificationsPlugin flp = FlutterLocalNotificationsPlugin();
    SharedPreferences prefsnot = await SharedPreferences.getInstance();
    String ttoken = prefsnot.getString('token')!;
    int notcounter=prefsnot.getInt('notcounter')!;
    _setHeaders() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $ttoken',
    };
    var response = await http.get(
      Uri.parse('https://emp.almatin.com/api/allRequestVacations'),
      headers: _setHeaders(),
    );
    String testaeh='تم استقبال طلبات إجازة من : '+'\n';

    var convert = json.decode(response.body);
    for(int i=0;i<convert['data'].length;i++){
      testaeh=testaeh+'${i+1}- '+convert['data'][i]['user']['name'].toString()+'\n';
    }
    var android = AndroidNotificationDetails(
      // largeIcon: DrawableResourceAndroidBitmap('assets/vector-office-character-illustration.jpg'),
      // ledColor: Colors.indigoAccent,
      enableVibration: true,
      // fullScreenIntent: true,
      playSound: true,
      colorized: true,
      enableLights: true,
      // channelShowBadge: true,
      groupChannelId,
      groupChannelName,
      icon: "@mipmap/ic_launcher",
      channelDescription: groupChannelDescription,
      subText: 'يوجد '+convert['data'].length.toString()+" إجازة قيد الإنتظار",
      priority: Priority.max,
      importance: Importance.max,
      color: Colors.indigoAccent,
      styleInformation: BigTextStyleInformation(''),
        groupKey: groupKey,

        setAsGroupSummary:true,

    );
    var platform = NotificationDetails(android: android);
    if(convert['data'].length>0)
    {
      notcounter++;
      prefsnot.setInt('notcounter', notcounter);
      await flp.show(
          /*notcounter*/0, 'برنامج موظفين شركة المتين', testaeh , platform,
          payload:
          'Navigator.push(context, MaterialPageRoute(builder: (context) => vacation_requests_page()));'
      );
    }
    // else
    // {}
    //////////////////////////////

    FlutterLocalNotificationsPlugin flp2 = FlutterLocalNotificationsPlugin();
    SharedPreferences prefsnot2 = await SharedPreferences.getInstance();
    String ttoken2 = prefsnot2.getString('token')!;
    String isShown2=prefsnot2.getString('isshown')!;
    _setHeaders2() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $ttoken2',
    };
    var response2 = await http.get(
      Uri.parse('https://emp.almatin.com/api/requestVacation'),
      headers: _setHeaders2(),
    );

    var convert2 = json.decode(response2.body);
    String sdv=convert2['data']['start_date'].toString();
    String edv=convert2['data']['end_date'].toString();
    String testaeh2=' تمت الموافقة على طلب الإجازة لديك من قبل رئيس القسم و رئيس قسم الموارد البشرية'+' و ذلك من تاريخ '+sdv+" الى تاريخ "+edv+'\n';

    var android2 = const AndroidNotificationDetails(
      enableVibration: true,
      // fullScreenIntent: true,
      playSound: true,
      colorized: true,
      enableLights: true,
      // channelShowBadge: true,
      groupChannelId,
      groupChannelName,
      icon: "@mipmap/ic_launcher",
      // largeIcon: DrawableResourceAndroidBitmap('assets/vector-office-character-illustration.jpg'),
      channelDescription: groupChannelDescription,
      subText: 'تم تحديث حالة طلب الإجازة لديك :',
      priority: Priority.max,
      importance: Importance.max,
      color: Colors.indigoAccent,
      styleInformation: BigTextStyleInformation(''),
      groupKey: groupKey,
      setAsGroupSummary:true,
    );
    var platform2 = NotificationDetails(android: android2);
    if(convert2['data']['request_status']==3 && isShown2=='not')
    {
      notcounter++;
    prefsnot2.setInt('notcounter', notcounter);
      prefsnot2.setString('isshown','yes');
      await flp2.show(
          /*notcounter*/ 1, 'برنامج موظفين شركة المتين', testaeh2 , platform2,
          payload:"duuud"
      );

    }
    else if((convert2['data']['request_status']==4||convert2['data']['request_status']==5) && isShown2=='not')
    {
      notcounter++;
      prefsnot2.setInt('notcounter', notcounter);
      prefsnot2.setString('isshown','yes');
      await flp2.show(
        /*notcounter*/ 2, 'برنامج موظفين شركة المتين', 'تم رفض طلب الإجازة' , platform2,
          payload:"duuud"
      );

    }
    // else
    // {}

    /////////////////////////////
    return Future.value(true);
  });
}

Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager().initialize(callBackground, isInDebugMode: false);
  await Workmanager().registerPeriodicTask('2', fetchBackground,
    existingWorkPolicy: ExistingWorkPolicy.replace,
    frequency: Duration(hours: 1),
    // initialDelay: Duration(seconds: 1),
    constraints: Constraints(networkType: NetworkType.connected,),
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
