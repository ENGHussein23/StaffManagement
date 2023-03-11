// import 'dart:async';
// import 'dart:convert';
// import 'dart:js';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:test01/login_screen/LoginPage.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../main_page/prime_page/primePage.dart';
// // import 'package:test01/models/user_model.dart';
// // import 'package:test01/services/user_service.dart';
// // import 'package:test01/models/AllRequestVacationsTest002.dart';
// // import 'package:test01/services/StuffMangement_Service.dart';
// // import 'package:test01/services/AllRequestVacationsService.dart';
// class FirstSplash extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return FirstSplashState();
//   }
// }
//
//
// ifSplash() async {
//   String tt='';
//   int ccc=0;
//   SharedPreferences prefs=await SharedPreferences.getInstance();
//   tt=prefs.getString('token')!;
//   ccc=prefs.getInt('Coki')!;
//   Uri myURLlog =Uri.https('emp.almatin.com','/api/salary',{'q':'dart'});
//   http.Response responselog= await http.get(myURLlog,
//       headers: {
//         'Accept':'application/json',
//         'Authorization':'Bearer $tt'
//       });
//   var jsonlog=json.decode(responselog.body);
//   if(jsonlog['success']==true)
//   {
//     token_test=tt;
//     Coki=ccc;
//     //     Navigator.pushAndRemoveUntil(context,
//     // MaterialPageRoute(
//     //     builder: (BuildContext context) {
//     //       return ifSplash();
//     //     }), (r) {
//     //   return false;
//     // })
//   }
// }
// // late AllRequestVacationsTest002 RequestVacationstest;
// // List<Data> RequestVacationsTesttest=RequestVacationstest!.data!;
// // int Vcountertest=RequestVacationsTesttest.length;
// class FirstSplashState extends State<FirstSplash> {
//
//   @override
//   void initState() async{
//     super.initState();
//
//     Timer(
//         Duration(seconds: 1),
//             () =>ifSplash()
//             //     Navigator.pushAndRemoveUntil(context,
//             // MaterialPageRoute(
//             //     builder: (BuildContext context) {
//             //       return ifSplash();
//             //     }), (r) {
//             //   return false;
//             // })
//     );
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//           color: Color.fromARGB(100, 245, 245, 245),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/almatin_logo.png',
//                 height: 200,
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               SpinKitSpinningLines(
//                 color: Colors.indigo,
//                 size: 100,
//               ),
//             ],
//           ),
//         ));
//   }
// }
