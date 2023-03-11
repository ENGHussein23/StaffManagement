import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test01/login_screen/LoginPage.dart';
import '../errorpage/ErrorPage.dart';
import '../main_page/dependencies/main_page_dep_0.dart';
import '../main_page/dependencies/main_page_dep_1.dart';
import '../main_page/dependencies/main_page_dep_2.dart';
import '../main_page/dependencies/main_page_dep_3.dart';
import '../main_page/dependencies/main_page_dep_4.dart';
import '../main_page/dependencies/main_page_dep_5.dart';
import '../main_page/dependencies/main_page_dep_6.dart';
import '../main_page/dependencies/main_page_dep_7.dart';
import '../main_page/dependencies/main_page_dep_8.dart';
import '../main_page/dependencies/main_page_dep_CEO.dart';
import '../main_page/dependencies/main_page_dep_Developer.dart';
import '../main_page/prime_page/primePage.dart';

// import 'package:test01/models/user_model.dart';
// import 'package:test01/services/user_service.dart';
// import 'package:test01/models/AllRequestVacationsTest002.dart';
// import 'package:test01/services/StuffMangement_Service.dart';
// import 'package:test01/services/AllRequestVacationsService.dart';
class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}
// int DD;
// int firstchangepass=0;
// ifchangedpass(ch,dep){
//   if(ch==0){
//     return ifmainpage(dep);
//   }
//   else if(ch==1)
//     {
//       return
//     }
// }
ifmainpage(dep){
  if(dep==0) return mainpageDep0(); // صلاحية موظف عادي
  else if(dep==10) return mainpageDep1(); // صلاحية مدير قسم
  else if(dep==11) return mainpageDep2(); // صلاحية مدير قسم القانة IT
  else if(dep==12) return mainpageDep3(); // صلاحية مدير قسم الموارد البشرية
  else if(dep==1) return mainpageDep4(); // صلاحية موظف موارد مسؤول توظيف
  else if(dep==2) return mainpageDep5(); // صلاحية موظف موارد مسؤول رواتب
  else if(dep==3) return mainpageDep6(); // صلاحية موظف موارد مسؤول تقييم و تأمينات
  else if(dep==4) return mainpageDep7(); // صلاحية موظف موارد مسؤول متابعة و عقوبات
  else if(dep==20) return mainpageDepCEO(); // صلاحية المدير العام
  else if(dep==99) return mainpageDeveloper(); // صلاحية المبرمج
}
// late AllRequestVacationsTest002 RequestVacationstest;
// List<Data> RequestVacationsTesttest=RequestVacationstest!.data!;
// int Vcountertest=RequestVacationsTesttest.length;
class SplashState extends State<Splash> {

  @override
  void initState() async{
    super.initState();
    // getAVRData();
    // getDataS();
    //  user_test.success==true?
    // bool something=false;
    // await primePageState().getData();
    // .then(Navigator.pushAndRemoveUntil(context,
    //     MaterialPageRoute(
    //         builder: (BuildContext context) {
    //           return ifmainpage(Coki);
    //         }), (r) {
    //       return false;
    //     }));
    //////////////////////////////////////////////////////////////////////
    // the old code //////////////////////////////////////////////////////
    // something?
    Timer(
        Duration(seconds: 1),
        () =>  Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(
                builder: (BuildContext context) {
                  return ifmainpage(Coki);
                }), (r) {
              return false;
            })
    );
    //     :    ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(
    //   content: Text(
    //       textAlign: TextAlign.center,
    //       textDirection: TextDirection.rtl,
    //       'يوجد خطأ في الإتصال بالشبكة, الرجاء إعادة المحاولة مجددا'),
    // ));
    /////////////////////////////////////////////////////////////////////
    // :
    //  Navigator.pushAndRemoveUntil(context,
    //      MaterialPageRoute(
    //          builder: (BuildContext context) {
    //            return errorpage();
    //          }), (r) {
    //        return false;
    //      });

            // Navigator.push(
            // context, MaterialPageRoute(builder: (context) => ifmainpage(Coki))));
  }
  // getDataS() async {
  //   user_test = await UserService().getUser();
  //   if (user_test != null) {
  //     setState(() {
  //       id = user_test.data.jobId.toString();
  //       name = user_test.data.name;
  //       adress = user_test.data.address;
  //       workname = user_test.data.placeOfJob;
  //       mobilenumber = user_test.data.phone;
  //       departmentHead = user_test.data.managerName;
  //       // isLoaded = true;
  //       mid = user_test.data.managerId.toString();
  //       print(user_test.data.name);
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(
  //         content: Text(
  //             textAlign: TextAlign.center,
  //             textDirection: TextDirection.rtl,
  //             'تم تسجيل الدخول بنجاح'),
  //       ));
  //     });
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(
  //       content: Text(
  //           textAlign: TextAlign.center,
  //           textDirection: TextDirection.rtl,
  //           ' 2تم تسجيل الدخول بنجاح'),
  //     ));
  //     Navigator.pushAndRemoveUntil(context,
  //         MaterialPageRoute(
  //             builder: (BuildContext context) {
  //               return ifmainpage(Coki);
  //             }), (r) {
  //           return false;
  //         });
  //   }
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromARGB(100, 245, 245, 245),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/almatin_logo.png',
            height: 200,
          ),
          SizedBox(
            height: 30,
          ),
          SpinKitSpinningLines(
            color: Colors.indigo,
            size: 100,
          ),
        ],
      ),
    ));
  }
}
