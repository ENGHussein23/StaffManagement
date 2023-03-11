import 'package:flutter/material.dart';
import 'package:test01/main_page/prime_page/primePage.dart';
import 'package:test01/main_page/vacation_page/vacationpage.dart';
import 'package:test01/main_page/salary_page/salarypage.dart';
import 'package:test01/main_page/rating/rating_page.dart';
import 'package:test01/main_page/vacation_requests/vacation_requests.dart';
import 'package:test01/main_page/upload_files/salary_file/salary_file.dart';
class mainpageDep5 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return mainpageDep5State();
  }
}
// int VC=Vcounter;


class mainpageDep5State extends State<mainpageDep5> {

  int counterBar=5;
  @override
  Widget build(BuildContext context) => DefaultTabController(

    length: counterBar,
    child: Scaffold(
      appBar: AppBar(
        title: Text("شركة المتين الصناعية",style: TextStyle(color: Colors.white)),
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
              icon: Icon(Icons.add_chart_outlined),
              text: 'رفع الملفات',
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
          Salary_file(),
        ],
      ),
    ),
  );
}