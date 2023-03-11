import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:test01/main_page/departments_head/DepartnentsHead.dart';
import 'package:test01/main_page/prime_page/primePage.dart';
import 'package:test01/main_page/statistics/Statistics_hr_emp.dart';
import 'package:test01/main_page/vacation_page/vacationpage.dart';
import 'package:test01/main_page/salary_page/salarypage.dart';
import 'package:test01/main_page/rating/rating_page.dart';
import 'package:test01/main_page/vacation_requests/vacation_requests.dart';
import 'package:test01/main_page/upload_files/upload_main.dart';
import 'package:test01/main_page/department_employees/department_employees.dart';
import 'package:test01/main_page/Staff_management/StuffMangement.dart';
import 'package:test01/main_page/statistics/Statistics.dart';
import 'package:test01/main_page/SplashScreen.dart';
class mainpageDeveloper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return mainpageDeveloperState();
  }
}
int VC=0;
// String version='0.0';
// String appName =" packageInfo.appName";
// String packageName =' packageInfo.packageName';
// String buildNumber = 'packageInfo.buildNumber';
// pi() async {
//   PackageInfo packageInfo = await PackageInfo.fromPlatform();
//   appName = packageInfo.appName;
//   packageName = packageInfo.packageName;
//   buildNumber = packageInfo.buildNumber;
//   version = packageInfo.version;
// }


class mainpageDeveloperState extends State<mainpageDeveloper> {

  int counterBar=11;
  @override
  Widget build(BuildContext context) => DefaultTabController(

    length: counterBar,
    child: Scaffold(
      appBar: AppBar(
        title: Text("شركة المتين الصناعية",style: TextStyle(color: Colors.white)),
        centerTitle: true,
        // leading: IconButton(
        //   color: Colors.white,
        //   icon: Icon(Icons.info_outlined),
        //   onPressed: (){
        //     showDialog(
        //         context: context,
        //         builder: (BuildContext context) {
        //           pi();
        //           return AlertDialog(
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(30),
        //             ),
        //             alignment: Alignment.center,
        //             icon: Icon(Icons.info_outline),
        //             scrollable: true,
        //             title: Text('al-matin 0.2'),
        //             content: Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: Form(
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.end,
        //                   children: <Widget>[
        //                     Text(
        //                       'تطبيق الإجازات لشركة المتين ',
        //                       style: TextStyle(
        //                           color: Colors.grey),
        //                       textAlign: TextAlign.end,
        //                     ),
        //                     Text(
        //
        //                       'الرجاء التأكد من تحديث التطبيق من موقع الإجازات الرسمي لآخر إصدار دائما',
        //                       style: TextStyle(
        //                           color: Colors.grey),
        //                       textAlign: TextAlign.end,
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             actions: [
        //               Container(
        //               )
        //             ],
        //           );
        //         });
        //   },
        //   iconSize: 25,
        //   alignment: Alignment.bottomRight,
        // ),
        leading: FloatingActionButton(
          onPressed: (){
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  // pi();
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    icon: Icon(Icons.info_outline),
                    scrollable: true,
                    title: Text('al-matin 0.2'),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'تطبيق الإجازات لشركة المتين ',
                              style: TextStyle(
                                  color: Colors.grey),
                              textAlign: TextAlign.end,
                            ),
                            Text(

                              'الرجاء التأكد من تحديث التطبيق من موقع الإجازات الرسمي لآخر إصدار بشكل مستمر',
                              style: TextStyle(
                                  color: Colors.grey),
                              textAlign: TextAlign.end,
                            ),
                            // Text(
                            //   'emp.almatin.com',
                            //   style: TextStyle(
                            //       color: Colors.grey[800]),
                            //   textAlign: TextAlign.center,
                            // ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    // color: Colors.indigoAccent, // Set border color
                                      color: Color.fromARGB(0, 0, 0, 0),
                                      width: 2.0), // Set border width
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(30.0)), // Set rounded corner radius
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 0,
                                        color: Colors.amber,
                                        offset: Offset(5, 3))
                                  ] // Make rounded corner of border
                              ),
                              height: 45,
                              alignment: Alignment.center,
                              // color: Colors.amber,
                              child: Text(
                                "emp.almatin.com",
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              // color: Colors.indigoAccent, // Set border color
                                color: Color.fromARGB(0, 0, 0, 0),
                                width: 2.0), // Set border width
                            borderRadius: BorderRadius.all(
                                Radius.circular(30.0)), // Set rounded corner radius
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 0,
                                  color: Colors.indigo,
                                  offset: Offset(5, 3))
                            ] // Make rounded corner of border
                        ),
                        // height: 45,
                        alignment: Alignment.center,
                        // color: Colors.amber,
                        child: Column(children: [
                          Text(
                            "م. حسين الحاج علي",
                            style: TextStyle(
                              color: Color.fromARGB(250, 96, 100, 100),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "فريق البرمجة في قسم التقانة المعلوماتية",
                            style: TextStyle(
                              color: Color.fromARGB(250, 96, 100, 100),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),

                        ],)
                      )
                    ],
                  );
                });
          },
          child: Icon(Icons.info_outlined,color: Colors.transparent,),
          elevation: 0,
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
          // focusColor: Colors.amber,
          hoverColor:  Colors.amber,
        ),
        backgroundColor: Colors.indigo,
        elevation: 20,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.indigo,
            ]),
          ),
        ),
        bottom: TabBar(
          labelColor: Colors.amber,
          indicatorWeight: 5,
          indicatorColor: Colors.amber,
          unselectedLabelColor: Colors.white,
          overlayColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(100,255,193,7)),
          isScrollable: true,
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: 'الصفحة الرئيسية',
            ),
            Tab(
              icon: Icon(Icons.add_card),
              text: 'طلب إجازة',
            ),
            Tab(
              icon: Icon(Icons.account_balance_wallet_rounded),
              text: 'الاستعلام عن الراتب',
            ),
            Tab(
              icon: Icon(Icons.rate_review_rounded),
              text: 'التقييم و المتابعة',
            ),
            Tab(
              icon: Icon(Icons.account_tree),
              text: 'موظفين القسم',
            ),
            Tab(
              icon: Icon(Icons.people_rounded),
              text: 'رؤساء الأقسام',
            ),
            Tab(
              icon: Icon(Icons.add_chart_outlined),
              text: 'رفع الملفات',
            ),
            Tab(
              icon: Icon(Icons.person_search),
              text: 'ادارة الموظفين',
            ),
            Tab(
              icon: Icon(Icons.stacked_bar_chart),
              text: 'احصائيات',
            ),
            Tab(
              icon: Icon(Icons.stacked_line_chart),
              text: ' Hr Emp احصائيات',
            ),
            Tab(
              icon:
              // Badge(
              //   position: BadgePosition.topStart(),
              //   badgeContent: Text(Vcountertest.toString(),
              //   style: TextStyle(color: Colors.white),),
              //   child: Icon(Icons.add_comment_outlined),
              // ),

              Icon(Icons.add_comment),
              text: 'طلبات الإجازة',
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          primePage(),
          vacationpage(),
          salarypage(),
          ratingpage(),
          Department_Employees(),
          DepartnentsHead(),
          UploadMain(),
          StuffMangement(),
          Statistics(),
          StatisticsHR(),
          vacation_requests_page(),

        ],
      ),
    ),
  );
}
