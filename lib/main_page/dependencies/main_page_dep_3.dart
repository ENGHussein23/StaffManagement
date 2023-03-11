import 'package:flutter/material.dart';
import 'package:test01/main_page/prime_page/primePage.dart';
import 'package:test01/main_page/vacation_page/vacationpage.dart';
import 'package:test01/main_page/salary_page/salarypage.dart';
import 'package:test01/main_page/rating/rating_page.dart';
import 'package:test01/main_page/vacation_requests/vacation_requests.dart';
import 'package:test01/main_page/upload_files/upload_main.dart';
import 'package:test01/main_page/vacation_requests/testt.dart';
import 'package:badges/badges.dart';
import 'package:test01/main_page/vacation_requests/request_card.dart';
import 'package:test01/main_page/department_employees/department_employees.dart';
import 'package:test01/main_page/Staff_management/StuffMangement.dart';
import 'package:test01/main_page/statistics/Statistics.dart';
import 'package:test01/main_page/departments_head/DepartnentsHead.dart';
class mainpageDep3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return mainpageDep3State();
  }
}
// int VC=Vcounter;


class mainpageDep3State extends State<mainpageDep3> {

  int counterBar=10;
  @override
  Widget build(BuildContext context) => DefaultTabController(

    length: counterBar,
    child: Scaffold(
      appBar: AppBar(
        title: Text("شركة المتين الصناعية",style: TextStyle(color: Colors.white)),
        // فينا نحط صورة بدل النص في التايتل داخل الاب بار
        //   Container(
        //   width: 70,
        //   height: 70,
        //   child: Image.network('https://almatin.com/wp-content/uploads/2022/05/new_logo.png'),
        // ),
        centerTitle: true,
        leading: IconButton(
          color: Color.fromARGB(0, 0, 0, 0),
          icon: Icon(Icons.refresh),
          onPressed: (){
            setState(() {
              // VC=Vcounter;
            });
          },
          iconSize: 44,
          alignment: Alignment.bottomRight,
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
              icon: Icon(Icons.account_tree),
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

              icon:
              // Badge(
              //   position: BadgePosition.topStart(),
              //   badgeContent: Text(VC.toString(),
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
          vacation_requests_page(),
        ],
      ),
    ),
  );
}
