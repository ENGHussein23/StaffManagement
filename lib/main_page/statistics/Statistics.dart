import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:test01/services/StuffMangement_Service.dart';

// import 'package:test01/models/Statistics003.dart';
// import 'package:test01/services/StatisticsService.dart';
import './SelectedVscstions.dart';
import './PendingVacation.dart';
import 'package:test01/login_screen/LoginPage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './SearchFirstDay.dart';
import './SearchEndDay.dart';
import './BetweenTwoDates.dart';

// import 'package:test01/services/StatisticsService.dart';
// import 'package:test01/models/StatisticsData.dart';
// import 'package:test01/models/StatisticsData.dart';
import 'package:test01/services/StatisticsServiceTest.dart';

class VacationViewModel {
  String NameV;
  String workLocationV;
  String VacationStartV;
  String VacationEndV;
  String MobileNumberV;
  String ResonV;

  VacationViewModel(
      {required this.NameV,
      required this.workLocationV,
      required this.VacationStartV,
      required this.VacationEndV,
      required this.MobileNumberV,
      required this.ResonV});
}

VacationViewModel test0001 = new VacationViewModel(
    NameV: 'حسين الحاج علي',
    workLocationV: 'الإدارة العامة',
    VacationStartV: '12/12/2022',
    VacationEndV: '12/12/2022',
    MobileNumberV: '0945825568',
    ResonV: 'السفر');
VacationViewModel test0002 = new VacationViewModel(
    NameV: 'حسين الحاج علي',
    workLocationV: 'الإدارة العامة',
    VacationStartV: '12/12/2022',
    VacationEndV: '12/12/2022',
    MobileNumberV: '0945825568',
    ResonV: ' السفر  السفر ');
String FirstDay = 'لم يتم الإختيار';
String EndDay = 'لم يتم الإختيار';

class Statistics extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StatisticsState();
  }
}

String vhanges = '';
bool desableV = false;
late List<dynamic> slv;
late List<dynamic> wlv;
late List<dynamic> blv;

class StatisticsState extends State<Statistics> {
  String testtesttest = '';
  late var lasttest;
  late var resbodylast;
  late var Blasttest;
  late var Bresbodylast;

  // late StatisticsData StatisticsTest003;
// late StatisticsData StatisticsTest;
//   late List<Vacations> WaitingVacations004 ;
  // int waitingcounter=WaitingVacations004.length;
  String EmpCount = '0';
  String HeadCount = '0';
  String VacationCount = '0';
  bool waitis = false;
  String tttoday = "${DateTime.now().toLocal()}".split(' ')[0];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttpStatisticsData();
  }

// getStatisticsData() async {
//   StatisticsTest003=(await StatisticsService().getStatisticsStatus())!;
//   if(StatisticsTest003.data !=null)
//     {
//       setState(() {
//         WaitingVacations004==StatisticsTest003.data!.waitingVacations;
//         waitis=true;
//         EmpCount=StatisticsTest003!.data!.employeeCount.toString();
//         HeadCount=StatisticsTest003!.data!.headCount.toString();
//         VacationCount=StatisticsTest003!.data!.vacationCount.toString();
//       });
//     }
//   // if(StatisticsTest.success==true)
//   //   {
//   //     setState(() {
//   //       EmpCount=StatisticsTest.data!.employeeCount!.toString();
//   //       HeadCount=StatisticsTest.data!.headCount!.toString();
//   //       VacationCount=StatisticsTest.data!.vacationCount!.toString();
//   //     });
//   //   }
// }

  // API طلب معلومات الإحصائيات
  getHttpStatisticsData() async {
    Uri myURL = Uri.https('emp.almatin.com', '/api/statistics', {'q': 'dart'});
    http.Response response = await http.get(myURL, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token_test'
    });
    var jsonn = response.body;
    lasttest = json.decode(jsonn);
    if (lasttest['data'] != null) {
      setState(() {
        // WaitingVacations004=lasttest['data'];
        slv = lasttest['data']['todayAcceptedVacations'];
        wlv = lasttest['data']['waitingVacations'];

        waitis = true;

        EmpCount = lasttest['data']['employeeCount'].toString();
        HeadCount = lasttest['data']['headCount'].toString();
        VacationCount = lasttest['data']['vacationCount'].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            // عدد الموظفين و عدد رؤساء الأقسام
            Container(
              width: 700,
              child: Row(
                children: [
                  Expanded(
                      child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromARGB(0, 0, 0, 0),
                      ),
                      borderRadius: BorderRadius.circular(5.0), //<-- SEE HERE
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 4,
                        ),
                        FittedBox(
                          child: Text('عدد الموظفين'),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        const Divider(
                          height: 10,
                          thickness: 1,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        FittedBox(
                          child: Text(EmpCount),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromARGB(0, 0, 0, 0),
                      ),
                      borderRadius: BorderRadius.circular(5.0), //<-- SEE HERE
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 4,
                        ),
                        FittedBox(
                          child: Text('عدد رؤساء الاقسام'),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        const Divider(
                          height: 10,
                          thickness: 1,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        FittedBox(
                          child: Text(HeadCount),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            // عدد إجازات اليزم و تاريخ اليوم
            Container(
              width: 700,
              child: Row(
                children: [
                  Expanded(
                      child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromARGB(0, 0, 0, 0),
                      ),
                      borderRadius: BorderRadius.circular(5.0), //<-- SEE HERE
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 4,
                        ),
                        FittedBox(
                          child: Text('عدد الاجازات اليوم'),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        const Divider(
                          height: 10,
                          thickness: 1,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        FittedBox(
                          child: Text(VacationCount),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromARGB(0, 0, 0, 0),
                      ),
                      borderRadius: BorderRadius.circular(5.0), //<-- SEE HERE
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 4,
                        ),
                        FittedBox(
                          child: Text('تاريخ اليوم'),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        const Divider(
                          height: 10,
                          thickness: 1,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        FittedBox(
                          child: Text(tttoday),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // إجازات موافق عليها
            Container(
              padding: EdgeInsets.all(10),
              width: 700,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Color.fromARGB(0, 0, 0, 0), // Set border color
                      width: 1.0), // Set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // Set rounded corner radius
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black38,
                        offset: Offset(1, 3))
                  ] // Make rounded corner of border
                  ),
              child: Column(
                children: <Widget>[
                  Card(
                    color: Colors.grey[200],
                    elevation: 0,
                    child: Text(
                      'إجازات اليوم الموافق عليها',
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    endIndent: 0,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Card(
                    elevation: 0,
                    child: Text(
                      'ملاحظة : يتم عرض الإجازة طيلة مدتها المحددة . فمثلا لو كانت مدة الإجازة 5 أيام يتم عرضها طيلة الخمس أيام القادمة و ليس فقط تاريخ الموافقة عليها.',
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    endIndent: 0,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  SingleChildScrollView(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    child: Container(
                        width: 660,
                        // height: 100,
                        child: SelectVacations()),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // إجازات قيد الإنتظار
            Container(
              padding: EdgeInsets.all(10),
              width: 700,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Color.fromARGB(0, 0, 0, 0), // Set border color
                      width: 1.0), // Set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // Set rounded corner radius
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black38,
                        offset: Offset(1, 3))
                  ] // Make rounded corner of border
                  ),
              child: Column(
                children: <Widget>[
                  Card(
                    color: Colors.grey[200],
                    elevation: 0,
                    child: Text(
                      'إجازات قيد الإنتظار (جميع الطلبات)',
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    endIndent: 0,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  SingleChildScrollView(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    child: Container(
                        width: 660,
                        // height: 100,
                        child: PendingVacation()),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // إجازات بيت تاريخين
            Container(
              padding: EdgeInsets.all(10),
              width: 700,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Color.fromARGB(0, 0, 0, 0), // Set border color
                      width: 1.0), // Set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // Set rounded corner radius
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black38,
                        offset: Offset(1, 3))
                  ] // Make rounded corner of border
                  ),
              child: Column(
                children: <Widget>[
                  Card(
                    color: Colors.grey[200],
                    elevation: 0,
                    child: Text(
                      'إجازات بين تاريخين',
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    endIndent: 0,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  calender_card_first_day_vacation(),

                  calender_card_end_day_vacation(),

                  // Container(
                  //   width: 600,
                  //   child: Card(
                  //     color: Colors.grey[300],
                  //     child: Row(
                  //       children: [
                  //         Expanded(
                  //           flex: 4,
                  //           child:
                  //           Text('7/12/2022', textAlign: TextAlign.center),
                  //         ),
                  //         Expanded(
                  //             flex: 1,
                  //             child: IconButton(
                  //               icon: Icon(Icons.calendar_month),
                  //               onPressed: () {},
                  //             ))
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   width: 600,
                  //   child: Card(
                  //     color: Colors.grey[300],
                  //     child: Row(
                  //       children: [
                  //         Expanded(
                  //           flex: 4,
                  //           child:
                  //           Text('7/12/2022', textAlign: TextAlign.center),
                  //         ),
                  //         Expanded(
                  //             flex: 1,
                  //             child: IconButton(
                  //               icon: Icon(Icons.calendar_month),
                  //               onPressed: () {},
                  //             ))
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Expanded(
                            child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 15,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              fixedSize: Size.fromHeight(40),
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.indigoAccent)),
                          child: FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              textDirection: TextDirection.rtl,
                              children: [
                                Text('بحث'),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(Icons.search),
                              ],
                            ),
                          ),
                          onPressed: () async {
                            print('FirstDay:' + FirstDay);
                            print('EndDay:' + EndDay);
                            // var formatter = DateFormat('dd-MM-yyyy');

                            // DateTime testfirstday=DateTime.parse(FirstDay) ;
                            // DateTime testEndDay=DateTime.parse(EndDay) ;
                            // var testdate=DateTime(testfirstday.year,testfirstday.month,testfirstday.day);
                            // print('testdate:'+testdate.toString());
                            // print('FirstDay:'+testfirstday.toString());
                            // print('EndDay:'+testEndDay.toString());
                            // //FirstDay,EndDay
                            var datab = {
                              "start_date": FirstDay,
                              "end_date": EndDay,
                            };
                            var resv = await StuffMangement_Service()
                                .postData(datab, '/api/statistics');
                            var resbodyv = json.decode(resv.body);
                            print(resbodyv);
                            if (resbodyv['success'] == true) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                    'تم استقبال البيانات بشكل صحيح'),
                              ));
                              setState(() {
                                if (desableV == false) desableV = true;

                                //////////////////////
                                blv = resbodyv['data'];
                              });
                            } else if (resbodyv['success'] == false) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                    'تم استقبال البيانات بشكل خاطئ'),
                              ));
                            }
                            else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                    'لم يتم إستقبال أي بيانات أي ان الارسال خاطئ'),
                              ));
                            }
                          },
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // blv==null||blv.length==0||blv.isEmpty?
                  desableV ? BetweenTwoDates() : Container(),
                  // desableV ?
                  // SelectVacations()
                  // : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
