import 'package:flutter/material.dart';
import '../main_page/mainpage.dart';
import '../main_page/SplashScreen.dart';
import './InputField.dart';
import './InputWrapper.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './CallApi.dart';

class Button extends StatelessWidget {
  // _login() async {
  //   var data={
  //     'job_id':empController,
  //     'password':passController,
  //   };
  //   var res=CallApi().postData(data,'login');
  //   var resbody= json.decode(res.body);
  //   if(resbody['success']){
  //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
  //       return mainpage();
  //     }), (r){
  //       return false;
  //     });
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => Splash()));
  //   }
  //   else
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(
  //       content: Text(
  //           textAlign: TextAlign.center,
  //           textDirection: TextDirection.rtl,
  //           'بيانات الإعتماد هذه غير متطابقة مع البيانات المسجلة لدينا'),
  //     ));
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(

          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            onPrimary: Colors.white,
            minimumSize: Size(200, 70),
            padding: EdgeInsets.symmetric(horizontal: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
          ),
          child: Text('تسجيل الدخول',style: TextStyle(fontSize: 20),),
          onPressed: () async {
            // // _login();
            // var data={
            //   'job_id':empController,
            //   'password':passController,
            // };
            // var res=CallApi().postData(data,'login');
            // var resbody= json.decode(res.body);
            // if(resbody['success']){
            //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
            //     return mainpage();
            //   }), (r){
            //     return false;
            //   });
            //   Navigator.push(
            //       context, MaterialPageRoute(builder: (context) => Splash()));
            // }
            // else
            //   ScaffoldMessenger.of(context)
            //       .showSnackBar(SnackBar(
            //     content: Text(
            //         textAlign: TextAlign.center,
            //         textDirection: TextDirection.rtl,
            //         'بيانات الإعتماد هذه غير متطابقة مع البيانات المسجلة لدينا'),
            //   ));


        },
          onLongPress: (){
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(
              content: Text(
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  'ادخل بانات تسجيل الدخول'),
            ));

          },
        ),
        ),

    );}
}
