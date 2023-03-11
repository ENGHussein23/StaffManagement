import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test01/models/user_model.dart';
import 'package:test01/services/StuffMangement_Service.dart';
import '../prime_page/my_card_tile.dart';
import '../prime_page/primePage.dart';
import 'calender_card_vacation.dart';
import 'calender_end_card_vacation.dart';
import 'package:test01/models/RequestStatusModel.dart';
import 'package:test01/services/RequestStatusService.dart';

int checkv = 0;
String StartDate = 'StartDate';
String EndDate = 'EndDate';
DateTime startD = DateTime.now();
DateTime endD = DateTime.now();
String CDate = '000';
late int VIDD;
late DateTime testendD;
var vacationtest;

class vacationpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return vacationpageState();
  }
}

late RequestStatusData RequestTest;
// خاص بمن رئيس قسمه السيد المدير العام
var vac00002 = Container(
  padding: EdgeInsets.all(10),
  width: 700,
  decoration: BoxDecoration(
      color: Color.fromARGB(200, 0, 150, 150),
      border: Border.all(
        // color: Colors.indigoAccent, // Set border color
          color: Color.fromARGB(255, 0, 100, 100),
          width: 2.0), // Set border width
      borderRadius:
      BorderRadius.all(Radius.circular(10.0)), // Set rounded corner radius
      boxShadow: [
        BoxShadow(blurRadius: 10, color: Colors.black38, offset: Offset(1, 3))
      ] // Make rounded corner of border
  ),
  child: Card(
    elevation: 0,
    color: Color.fromARGB(0, 0, 150, 150),
    child: RichText(
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      text: TextSpan(
          text: 'تم ارسال طلب الإجازة ',
          style: TextStyle(
            color: Color.fromARGB(235, 10, 35, 37),
            // fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          children: [
            TextSpan(
              text: ''
                  'يرجى أخذ الموافقة من السيد المدير العام على الواتس أب أو عبر رسالة أو بشكل شخصي  ',
              style: TextStyle(
                color: Color.fromARGB(235, 10, 35, 37),
                fontSize: 16,
              ),
            ),
            // TextSpan(
            //   recognizer: TapGestureRecognizer()..onTap = ()  {
            //
            //   },
            //   text: '\n إلغاء طلب الإجازة',
            //   style: TextStyle(
            //     backgroundColor: Color.fromARGB(255, 0, 140, 140),
            //     color: Color.fromARGB(255, 10, 55, 30),
            //     fontWeight: FontWeight.bold,
            //     fontSize: 16,
            //   ),
            // ),
          ]),
    ),
  ),
);
// تم ارسال طلب الاجازة
var vac1 = Container(
  padding: EdgeInsets.all(10),
  width: 700,
  decoration: BoxDecoration(
      color: Color.fromARGB(200, 0, 150, 150),
      border: Border.all(
          // color: Colors.indigoAccent, // Set border color
          color: Color.fromARGB(255, 0, 100, 100),
          width: 2.0), // Set border width
      borderRadius:
          BorderRadius.all(Radius.circular(10.0)), // Set rounded corner radius
      boxShadow: [
        BoxShadow(blurRadius: 10, color: Colors.black38, offset: Offset(1, 3))
      ] // Make rounded corner of border
      ),
  child: Card(
    elevation: 0,
    color: Color.fromARGB(0, 0, 150, 150),
    child: RichText(
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      text: TextSpan(
          text: 'تم ارسال طلب الإجازة ',
          style: TextStyle(
            color: Color.fromARGB(235, 10, 35, 37),
            // fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          children: [
            TextSpan(
              text: ''
                  'في انتظار موافقة رئيس القسم و رئيس قسم الموارد البشرية  ',
              style: TextStyle(
                color: Color.fromARGB(235, 10, 35, 37),
                fontSize: 16,
              ),
            ),
            // TextSpan(
            //   recognizer: TapGestureRecognizer()..onTap = ()  {
            //
            //   },
            //   text: '\n إلغاء طلب الإجازة',
            //   style: TextStyle(
            //     backgroundColor: Color.fromARGB(255, 0, 140, 140),
            //     color: Color.fromARGB(255, 10, 55, 30),
            //     fontWeight: FontWeight.bold,
            //     fontSize: 16,
            //   ),
            // ),
          ]),
    ),
  ),
);
// تم الموافقة عليها من رئيس القسم , في انتظار موافقة رئيس قسم الموارد البشرية
var vac2 = Container(
  padding: EdgeInsets.all(10),
  width: 700,
  decoration: BoxDecoration(
      color: Color.fromARGB(200, 0, 150, 150),
      border: Border.all(
          // color: Colors.indigoAccent, // Set border color
          color: Color.fromARGB(255, 0, 100, 100),
          width: 2.0), // Set border width
      borderRadius:
          BorderRadius.all(Radius.circular(10.0)), // Set rounded corner radius
      boxShadow: [
        BoxShadow(blurRadius: 10, color: Colors.black38, offset: Offset(1, 3))
      ] // Make rounded corner of border
      ),
  child: Card(
    elevation: 0,
    color: Color.fromARGB(0, 0, 150, 150),
    child: RichText(
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      text: TextSpan(
          text:
              'تم الموافقة على طلب الاجازة من قبل رئيس القسم , في انتظار موافقة رئيس قسم الموارد البشرية  ',
          style: TextStyle(
            color: Color.fromARGB(235, 10, 35, 37),
            // fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          children: []),
    ),
  ),
);
//تم الموافقة عليها على طلب الاجازة
var vac3 = Container(
  padding: EdgeInsets.all(10),
  width: 700,
  decoration: BoxDecoration(
      color: Color.fromARGB(200, 0, 150, 200),
      border: Border.all(
          // color: Colors.indigoAccent, // Set border color
          color: Color.fromARGB(255, 12, 69, 122),
          width: 2.0), // Set border width
      borderRadius:
          BorderRadius.all(Radius.circular(10.0)), // Set rounded corner radius
      boxShadow: [
        BoxShadow(blurRadius: 10, color: Colors.black38, offset: Offset(1, 3))
      ] // Make rounded corner of border
      ),
  child: Card(
    elevation: 0,
    color: Color.fromARGB(0, 0, 150, 200),
    child: RichText(
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      text: TextSpan(
          text:
              'تم الموافقة على طلب الإجازة من قبل رئيس القسم و رئيس قسم الموارد البشرية ',
          style: TextStyle(
            color: Color.fromARGB(255, 12, 69, 122),
            // fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          children: []),
    ),
  ),
);
//تم رفض الاجازة من قبل رئيس القسم
var vac4 = Container(
  padding: EdgeInsets.all(10),
  width: 700,
  decoration: BoxDecoration(
      color: Color.fromARGB(250, 255, 97, 97),
      border: Border.all(
          // color: Colors.indigoAccent, // Set border color
          color: Color.fromARGB(150, 150, 0, 0),
          width: 2.0), // Set border width
      borderRadius:
          BorderRadius.all(Radius.circular(10.0)), // Set rounded corner radius
      boxShadow: [
        BoxShadow(blurRadius: 10, color: Colors.black38, offset: Offset(1, 3))
      ] // Make rounded corner of border
      ),
  child: Card(
    elevation: 0,
    color: Color.fromARGB(0, 150, 0, 0),
    child: RichText(
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      text: TextSpan(
          text: 'تم رفض الاجازة من قبل رئيس القسم ',
          style: TextStyle(
            color: Color.fromARGB(255, 250, 250, 250),
            // fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          children: []),
    ),
  ),
);
// تمت الموافقة على طلب الاجازة من قبل رئيس القسم و تم رفضها من قبل رئيس قسم الموارد البشرية
var vac5 = Container(
  padding: EdgeInsets.all(10),
  width: 700,
  decoration: BoxDecoration(
      color: Color.fromARGB(150, 90, 0, 0),
      border: Border.all(
          // color: Colors.indigoAccent, // Set border color
          color: Color.fromARGB(150, 150, 0, 0),
          width: 2.0), // Set border width
      borderRadius:
          BorderRadius.all(Radius.circular(10.0)), // Set rounded corner radius
      boxShadow: [
        BoxShadow(blurRadius: 10, color: Colors.black38, offset: Offset(1, 3))
      ] // Make rounded corner of border
      ),
  child: Card(
    elevation: 0,
    color: Color.fromARGB(0, 150, 0, 0),
    child: RichText(
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      text: TextSpan(
          text:
              'تمت الموافقة على طلب الاجازة من قبل رئيس القسم و تم رفضها من قبل رئيس قسم الموارد البشرية  ',
          style: TextStyle(
            color: Color.fromARGB(255, 250, 250, 250),
            // fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          children: []),
    ),
  ),
);
TextEditingController reasoncontroller = TextEditingController();

class vacationpageState extends State<vacationpage> {
  DateTime ttoday = DateTime.now();
  String endstatus = '0';
  bool checkvacationstatus = false;
  bool checkvacationstatus45 = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vacationstatus();
  }

  vacationstatus() async {
    RequestTest = (await RequestStatusService().getRequestStatus())!;
    VIDD = RequestTest.data!.id!;
    setState(() {
      checkv = RequestTest.data!.requestStatus!;
      testendD = RequestTest.data!.endDate!;
      if (checkv == 1||checkv == 2||checkv == 3||checkv == 4||checkv == 5) {
        checkvacationstatus = true;
      }
    });
    ttoday = DateTime.now();
    endstatus = (testendD.difference(ttoday).inDays).toString();
    if ((checkv == 1 ||checkv == 2 || checkv == 4 || checkv == 5) &&
        int.parse(endstatus) <= -1) {
      var deletev = {
        "vacation_id": VIDD,
      };
      var resdeletev = await StuffMangement_Service()
          .postData(deletev, '/api/deleteVacation');
      var resbodyresdeletev = json.decode(resdeletev.body);
      print(resbodyresdeletev);
      if (resbodyresdeletev['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              'تم حذف الإجازة المعلقة'),
        ));
      }
      setState(() {
        checkv = 0;
      });
    }
  }
  //فحص حالة الطلب
  CheckRequestStatus(v) {
    // if ( int.parse(endstatus)<0)
    // {
    //   var datavd = {
    //     '':StartDate,
    //   };
    //   return Container();
    // }
    // else
    if (v == 1)
      {
        checkvacationstatus45=false;
        return vac1;
      }

    else if (v == 2)
      {
        checkvacationstatus45=false;
        return vac2;
      }

    else if (v == 3)
      {
        checkvacationstatus45=false;
        return vac3;
      }

    else if (v == 4)
      {
        checkvacationstatus45=true;
        return vac4;
      }

    else if (v == 5)
      {
        checkvacationstatus45=true;
        return vac5;
      }

    else
      return Container();
  }

  // void lingth_vacation() {
  //   String lingth_date = "0";
  //   setState(() {
  //     lingth_date = (startD.difference(endD).inDays).toString();
  //     lingth_date = (int.parse(lingth_date) + 1).toString();
  //     CDate = lingth_date;
  //   });
  // }
  // void cansel_order(){
  //   setState(() {
  //     StartDate = 'StartDate';
  //     EndDate = 'EndDate';
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Align(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        // padding: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              checkvacationstatus
                  ? CheckRequestStatus(checkv)
                  :Container(),
              //الاجازة مرفوضة و فينه يبعت طلب تاني
              checkvacationstatus45?
              Container(
                      padding: EdgeInsets.all(10),
                      width: 700,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              // color: Colors.indigoAccent, // Set border color
                              color: Color.fromARGB(0, 0, 0, 0),
                              width: 2.0), // Set border width
                          borderRadius: BorderRadius.all(Radius.circular(
                              10.0)), // Set rounded corner radius
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black38,
                                offset: Offset(1, 3))
                          ] // Make rounded corner of border
                          ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topRight,
                            color: const Color.fromARGB(120, 245, 245, 245),
                            child: Text(
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              'طلب إجازة :',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 23,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            endIndent: 0,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          MyCardTile(xctext: "رقم الموظف:", yctext: id),
                          SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            endIndent: 0,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          MyCardTile(
                              xctext: "رئيس القسم:", yctext: departmentHead),
                          SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            endIndent: 0,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          calender_card_vacation(),
                          SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            endIndent: 0,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          calender_end_card_vacation(),
                          SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            endIndent: 0,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            constraints: const BoxConstraints(
                                minWidth: 580,
                                maxWidth: 580,
                                maxHeight: 65,
                                minHeight: 40),
                            color: const Color.fromARGB(120, 245, 245, 245),
                            child: Text(
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              'الأسباب :',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: Color.fromARGB(190, 15, 15, 15),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              'ملاحظة : حقل السبب إجباري ولا يمكن تخطيه, لإرسال طلب الإجازة يجب عليك إرسال السبب.',
                              textAlign: TextAlign.start,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                              fontSize: 16)),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 580,
                            child: TextField(
                              controller: reasoncontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              textDirection: TextDirection.rtl,
                              textAlignVertical: TextAlignVertical.center,
                              maxLines: 3,
                              textAlign: TextAlign.right,
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              constraints: const BoxConstraints(
                                  minWidth: 580,
                                  maxWidth: 580,
                                  maxHeight: 65,
                                  minHeight: 40),
                              color: const Color.fromARGB(120, 245, 245, 245),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Expanded(
                                    //     child: SizedBox.expand(
                                    //   child: RaisedButton(
                                    //     color: Colors.red,
                                    //     textColor: Colors.white,
                                    //     elevation: 10,
                                    //     child: Text(
                                    //       'إلغاء الطلب',
                                    //       style: TextStyle(fontSize: 20),
                                    //     ),
                                    //     onPressed: () {cansel_order();},
                                    //   ),
                                    // )),
                                    // SizedBox(
                                    //   width: 20,
                                    // ),
                                    Expanded(
                                        child: SizedBox.expand(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                          onPrimary: Colors.white,
                                          primary: Colors.grey[300],
                                          minimumSize: Size(88, 36),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2)),
                                          ),
                                        ),
                                        child: Text(
                                          'إرسال الطلب',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        onPressed: () async {
                                          print('start '+StartDate);
                                          print('end :'+EndDate);
                                          if(reasoncontroller.text.isEmpty||reasoncontroller.text==''||StartDate == 'StartDate'||EndDate=='EndDate')
                                            {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                    TextDirection.rtl,
                                                    'الرجاء تضمين السبب و التأكد من بقية المعلومات المدخلة'),
                                              ));
                                            }
                                          else{
                                            var datav = {
                                              "job_id": id,
                                              "head_id": mid,
                                              "start_date": StartDate,
                                              "end_date": EndDate,
                                              "reasons": reasoncontroller.text,
                                            };
                                            var resv =
                                            await StuffMangement_Service()
                                                .postData(datav,
                                                '/api/requestVacation');
                                            var resbodyv = json.decode(resv.body);
                                            print(datav);
                                            print(resbodyv);
                                            if (resbodyv['success'] == true) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                    TextDirection.rtl,
                                                    'تم ارسال طلب الاجازة'),
                                              ));


                                              SharedPreferences prefs=await SharedPreferences.getInstance();
                                              prefs.setString('isshown','not');
                                              setState(() {
                                                checkvacationstatus = true;
                                                checkv = resbodyv['data']
                                                ['request_status'];
                                              });
                                            }
                                          }

                                        },
                                      ),
                                      // TextButton(
                                      //   // color: Colors.green,
                                      //   // textColor: Colors.white,
                                      //  // elevation: 10,
                                      //   child: Text(
                                      //     'إرسال الطلب',
                                      //     style: TextStyle(fontSize: 20),
                                      //   ),
                                      //   onPressed: () {},
                                      // ),
                                    )),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ):Container(),
              departmentHead=='وسيم عبد المتين  الاخوان'&&checkvacationstatus?
              vac00002
                  : Container(),
              SizedBox(
                height: 10,
              ),
              // cancel vacation request
              checkvacationstatus
                  && (checkv == 1||checkv == 2)
                  ? Container(
                      width: 700,
                      child: Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                            onPressed: () async {
                              var deletev = {
                                "vacation_id": VIDD,
                              };
                              var resdeletev = await StuffMangement_Service()
                                  .postData(deletev, '/api/deleteVacation');
                              var resbodyresdeletev =
                                  json.decode(resdeletev.body);
                              print(resbodyresdeletev);
                              if (resbodyresdeletev['success']) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                      'تم الغاء طلب الاجازة'),
                                ));
                                SharedPreferences prefsv=await SharedPreferences.getInstance();
                                prefsv.setString('isshown','yes');
                                setState(() {
                                  checkvacationstatus = false;
                                  checkv = 0;
                                });
                              }
                            },
                            child: Text(
                              'إلغاء طلب الإجازة',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              elevation: 15,
                              minimumSize: Size.fromHeight(50),
                              backgroundColor: Colors.redAccent,
                            ),
                          ))
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      );
    })));
  }
}
